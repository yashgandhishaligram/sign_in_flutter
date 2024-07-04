import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.userData.photoUrl == null
                ? const CircleAvatar(
                    radius: 55, // Image radius
                    backgroundImage: AssetImage('assets/images/no_profile.png'),
                  )
                : CircleAvatar(
                    radius: 55, // Image radius
                    backgroundImage:
                        NetworkImage(controller.userData.photoUrl!),
                  ),
            const SizedBox(
              height: 10,
            ),
            Text(
              controller.userData.firstName ??
                  "${controller.userData.firstName}  ${controller.userData.lastName}",
              style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              controller.userData.email ?? "",
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.redAccent)),
                onPressed: () => controller.doLogout(controller.userData.loginType!),
                child: const Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}

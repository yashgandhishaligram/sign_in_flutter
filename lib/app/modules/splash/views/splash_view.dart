import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/google_logo.jpg",
                  width: 80,
                  height: 80,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.facebook,
                  size: 80,
                  color: Colors.blue,
                ),
              ],
            ),
            const Text(
              "Social Logins",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

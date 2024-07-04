import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            googleSignInButton(),
            const SizedBox(height: 20),
            faceBookSignInButton(),
            const SizedBox(height: 20),
            //appleSignInButton()
          ],
        ),
      ),
    );
  }

  Widget googleSignInButton(){
    return Align(
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () {
          controller.doGoogleSignIn();
        },
        icon: Image.asset(
          "assets/images/google_logo.jpg",
          width: 30,
          height: 30,
        ),
        label: const Text(
          "Sign in with Google",
          style:TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  Widget faceBookSignInButton(){
    return Align(
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () {
          controller.doFacebookSignIn();
        },
        icon: Image.asset(
          "assets/images/fb_logo.png",
          width: 30,
          height: 30,
        ),
        label: const Text(
          "Sign in with Facebook",
          style:TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

  Widget appleSignInButton(){
    return Align(
      alignment: Alignment.center,
      child: TextButton.icon(
        onPressed: () {
          controller.doAppleSignIn();
        },
        icon: Image.asset(
          "assets/images/apple_logo.png",
          width: 30,
          height: 30,
        ),
        label: const Text(
          "Sign in with Apple",
          style:TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey,
          padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 10,
              right: 10),
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}

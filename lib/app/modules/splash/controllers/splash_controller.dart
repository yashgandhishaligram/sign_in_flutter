import 'dart:async';
import 'package:get/get.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';
import 'package:sign_in_flutter/app/routes/app_pages.dart';
import 'package:sign_in_flutter/app/utils/box_storage.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLogin();
  }

  void _checkLogin() async {
    UserModel? userData = GetStorageHelper().getUserData();
    if (userData != null) {
      UserModel user = UserModel(
        loginType: userData.loginType,
        uid: userData.uid,
        firstName: userData.firstName,
        email: userData.email,
        lastName: userData.lastName,
        photoUrl: userData.photoUrl
      );
      goToHome(user);
    } else {
      goToLogin();
    }
  }

  goToLogin() {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.LOGIN);
    });
  }

  goToHome(UserModel userData) {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.HOME, arguments: userData);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_flutter/app/repository/apple_repository.dart';
import 'package:sign_in_flutter/app/repository/facebook_repository.dart';
import 'package:sign_in_flutter/app/routes/app_pages.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';
import 'package:sign_in_flutter/app/utils/box_storage.dart';
import '../../../repository/google_repository.dart';

class LoginController extends GetxController {
  GoogleRepository googleRepository = GoogleRepository();
  FacebookRepository facebookRepository = FacebookRepository();
  AppleRepository appleRepository = AppleRepository();


  Future doGoogleSignIn() async {
    try {
      UserModel? userModel = await googleRepository.signIn();
      if (userModel != null) {
        await GetStorageHelper().setUserData(userModel);
        Get.offAndToNamed(Routes.HOME, arguments: userModel);
      }
    } catch (e) {
      showErrorMsg(e.toString());
    }
  }

  Future doFacebookSignIn() async {
    try {
      var userDetails = await facebookRepository.signIn();
      if (userDetails != null) {
        await GetStorageHelper().setUserData(userDetails);
        Get.offAndToNamed(Routes.HOME, arguments: userDetails);
      }
    } catch(e){
      showErrorMsg(e.toString());
    }
  }

  Future doAppleSignIn() async {
    try {
      var userDetails = await appleRepository.signIn();
      if (userDetails != null) {
        await GetStorageHelper().setUserData(userDetails);
        Get.offAndToNamed(Routes.HOME, arguments: userDetails);
      }
    } catch(e){
      showErrorMsg(e.toString());
    }
  }

  void showErrorMsg(String msg) {
    Get.rawSnackbar(
        messageText: Text(msg,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )),
        isDismissible: false,
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        borderRadius: 4,
        snackPosition: SnackPosition.BOTTOM);
  }
  @override
  void onClose() {
    super.onClose();
  }
}

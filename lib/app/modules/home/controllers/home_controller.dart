import 'package:get/get.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';
import 'package:sign_in_flutter/app/repository/apple_repository.dart';
import 'package:sign_in_flutter/app/repository/facebook_repository.dart';
import 'package:sign_in_flutter/app/repository/google_repository.dart';
import 'package:sign_in_flutter/app/routes/app_pages.dart';
import 'package:sign_in_flutter/app/utils/box_storage.dart';

class HomeController extends GetxController {
  GoogleRepository googleRepository = GoogleRepository();
  FacebookRepository facebookRepository = FacebookRepository();
  AppleRepository appleRepository = AppleRepository();
  UserModel userData = Get.arguments;

  void doLogout(String loginType) {
    if(loginType == "GOOGLE") {
      googleRepository.signOut();
      Get.offAndToNamed(Routes.LOGIN);
    }else if(loginType == "FACEBOOK"){
      facebookRepository.signOut();
      Get.offAndToNamed(Routes.LOGIN);
    }else if(loginType == "APPLE"){
      Get.offAndToNamed(Routes.LOGIN);
    }
    GetStorageHelper().setUserData(null);
  }

}

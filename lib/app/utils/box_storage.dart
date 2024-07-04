import 'package:get_storage/get_storage.dart';
import '../data/models/user_model.dart';

class GetStorageHelper {
  static final GetStorageHelper _singleton = GetStorageHelper._internal();
  static const String userToken = "TOKEN";
  static const String user = "USER";

  GetStorage box = GetStorage();

  GetStorageHelper._internal();

  factory GetStorageHelper() {
    return _singleton;
  }

  Future<void> setToken(String? token) async {
    if (token != null) {
      await box.write(userToken, token.toString());
    }
  }

  String? getToken() {
    var value = box.read(userToken);
    if (value == null) return null;
  }

  Future<void> setUserData(UserModel? userData) async {
    if (userData != null) {
      await box.write(user, userData);
    }else{
      await box.write(user, null);
    }
  }

  UserModel? getUserData() {
    var value = box.read(user);
    if(value != null){
      return UserModel.fromJson(value);
    }else {
      return null;
    }
  }

}
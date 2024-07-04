import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';
import 'package:sign_in_flutter/app/utils/exception.dart';

class FacebookRepository {
  final FacebookLogin _facebookLogin = FacebookLogin();
  // final _firebaseAuth = FirebaseAuth.instance;
  String LOGIN_TYPE = "FACEBOOK";

  Future<UserModel?> signIn({bool isFirebase = false}) async {
    try {
      final signInAccount = await _facebookLogin.logIn(
        permissions: [
          FacebookPermission.publicProfile,
          FacebookPermission.email,
        ],
      );
      if (signInAccount.status == FacebookLoginStatus.success) {
        final FacebookAccessToken? accessToken = signInAccount.accessToken;
        final token = accessToken?.token;
        FacebookUserProfile? profile = await _facebookLogin.getUserProfile();
        final imageUrl = await _facebookLogin.getProfileImageUrl(width: 100);
        final email = await _facebookLogin.getUserEmail();
        UserModel userModel = UserModel(
            loginType: LOGIN_TYPE,
            firstName: profile?.firstName,
            lastName: profile?.lastName,
            email: email,
            uid: profile?.userId,
            photoUrl: imageUrl);
        return userModel;
      } else if (signInAccount.status == FacebookLoginStatus.cancel) {
       // User canceled login
      } else if (signInAccount.status == FacebookLoginStatus.error) {
        // User login Failed
      }
    } catch (e) {
      if (e is FirebaseException) {
        switch (e.code) {
          case "network-request-failed":
            throw UserException("Please connect to internet and try again.");
          case "sign_in_failed":
            throw UserException(
                "Signing in with google failed. Email may be already in use");
          case "too-many-requests":
            throw UserException("Too many attempts. Please try again later!");
        }
      } else if (e is Exception) {
        throw UserException(e.toString());
      }
    }
  }
  //
  Future<bool> isGoogleSignedIn() async {
    return await _facebookLogin.isLoggedIn;
  }

  Future signOut() async {
    await _facebookLogin.logOut();
  }
}

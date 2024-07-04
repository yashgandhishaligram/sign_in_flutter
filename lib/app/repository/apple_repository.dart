import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';
import 'package:sign_in_flutter/app/utils/exception.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleRepository {
  String LOGIN_TYPE = "APPLE";


  Future<UserModel?> signIn({bool isFirebase = false}) async {
    try {
      final loggedUser = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ]);
      if (isFirebase) {
        /* final oAuthProvider = OAuthProvider("apple.com");
         final firebaseCredential = oAuthProvider.credential(
          idToken: loggedUser.identityToken,
          accessToken: loggedUser.authorizationCode,
        );
         final authResult = await _firebaseAuth.signInWithCredential(firebaseCredential);
        final user = authResult.user;
        if (user == null) throw UserException("User could not be found");
          final displayName = '${loggedUser.givenName} ${loggedUser.familyName}';
          await user.updateProfile(displayName: displayName); */
        UserModel userModel = UserModel(
            loginType: LOGIN_TYPE,
            firstName: loggedUser.givenName,
            email: loggedUser.familyName,
            uid: loggedUser.userIdentifier);
        return userModel;
      } else {
        UserModel userModel = UserModel(
            loginType: LOGIN_TYPE,
            firstName: loggedUser.givenName,
            email: loggedUser.familyName,
            uid: loggedUser.userIdentifier);
        return userModel;
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

  Future<bool> isAppleSignedInAvailable() async {
    return await SignInWithApple.isAvailable();
  }

}

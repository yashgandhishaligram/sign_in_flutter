import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_flutter/app/utils/exception.dart';
import 'package:sign_in_flutter/app/data/models/user_model.dart';

class GoogleRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  String LOGIN_TYPE = "GOOGLE";


  Future<UserModel?> signIn({bool isFirebase = false}) async {
    try {
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
      final auth = await signInAccount?.authentication;
      if (isFirebase) {
        final firebaseAuth = FirebaseAuth.instance;
        final credential = GoogleAuthProvider.credential(
            idToken: auth!.idToken, accessToken: auth.accessToken);
        /*  Map<String, dynamic> idMap = _parseJwt(auth.idToken)!;*/   //convert to jwt token
        final authResult = await firebaseAuth.signInWithCredential(credential);
        final authUser = authResult.user;
        UserModel userModel = UserModel(
            loginType: LOGIN_TYPE,
            firstName: authUser!.displayName,
            email: authUser.email,
            uid: authUser.uid,
            photoUrl: authUser.photoURL);
        return userModel;
      } else {
        UserModel userModel = UserModel(
            loginType: LOGIN_TYPE,
            firstName: signInAccount!.displayName,
            email: signInAccount.email,
            uid: signInAccount.id,
            photoUrl: signInAccount.photoUrl);
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

  Future<bool> isGoogleSignedIn() async {
    return await _googleSignIn.isSignedIn();
  }

  Future signOut() async {
    await _googleSignIn.signOut();
  }

  Map<String, dynamic>? _parseJwt(String? token) {
    if (token == null) return null;
    final List<String> parts = token.split('.');
    if (parts.length != 3) {
      return null;
    }
    final String payload = parts[1];
    final String norm = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(norm));
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }

    return payloadMap;
  }
}



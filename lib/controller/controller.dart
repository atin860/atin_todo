import 'dart:developer';

import 'package:atin_todo/screens/home_screen/home.dart';
import 'package:atin_todo/screens/login_or_signup/loginorSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 1), () {
      auth.userChanges().listen((user) {
        if (user == null) {
          Get.offAll(() => LoginOrSignup());
        } else {
          Get.offAll(() => HomeScreen());
        }
      });
    });
  }

  void login(String email, String password) async {
    try {
      final Credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signup(String email, String password) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await auth.signOut();
  }

  void forgetPassword(String email) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => log('Send otp to $email'));
    } catch (e) {
      print(e);
    }
  }
}

FirebaseAuth auth = FirebaseAuth.instance;

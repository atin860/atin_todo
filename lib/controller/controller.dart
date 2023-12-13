import 'dart:developer';

import 'package:atin_todo/screens/home_screen/home.dart';
import 'package:atin_todo/screens/login_or_signup/loginorSignup.dart';
import 'package:atin_todo/widget/loading.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

// Main Controller
class MainController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 1), () {
      auth.userChanges().listen((user) {
        if (user == null) {
          Get.offAll(() => LoginOrSignup());
        } else {
          // Get.offAll(() => MyApp());
          Get.offAll(() => HomeScreen());
        }
      });
    });
  }

//Login Screen controller
  void login(String email, String password) async {
    showLoading();
    try {
      final Credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      dismissLoadingWidget();
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        showToastMessage('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        showToastMessage('Wrong password provided for that user.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        print('Wrong password provided for that user.');
        showToastMessage('Wrong email or password.');
      } else {
        log("FirebaseAuthException: $e");
        showToastMessage(e.message!);
      }
    } catch (e) {
      dismissLoadingWidget();
      log("catch error: $e");
      showToastMessage(e.toString());
    }
  }

// Signup Screen controller
  void signup(String email, String password, String name) async {
    showLoading();
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      dismissLoadingWidget();
      showToastMessage('Account created successfully');
      credential.user!.updateDisplayName(name); // TO SET THE NAME OF THE USER
      // auth.currentUser!.displayName??"";   TO GET THE NAME OF THE USER
    } on FirebaseAuthException catch (e) {
      dismissLoadingWidget();
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        showToastMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showToastMessage('The account already exists for that email.');
      } else {
        print(e);
        showToastMessage(e.message!);
      }
      dismissLoadingWidget();
    } catch (e) {
      dismissLoadingWidget();
      print(e);
      showToastMessage(e.toString());
    }
  }

// Logout button controller
  void logout() async {
    await auth.signOut();
  }

// Forget button controller
  void forgetPassword(String email) async {
    showLoading();
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => log('Send otp to $email'));
      dismissLoadingWidget();
      showToastMessage('Reset password link sent to $email');
    } catch (e) {
      dismissLoadingWidget();
      print(e);
      showToastMessage(e.toString());
    }
  }
}

FirebaseAuth auth = FirebaseAuth.instance;

import 'package:atin_todo/screens/login_screen/login.dart';
import 'package:atin_todo/screens/sign_up/signUp.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Login or Signup',
        isBackButton: false,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Welcome To\nOur\nTodo App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Our Todo App is a simple app that helps you to manage your daily tasks.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: 100,
            child: SvgPicture.asset(
              'assets/images/img_logo_gray_50_01.svg',
              width: 8,
              // Specify the width
              // height: 10,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Get in touch with us",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )),
          SizedBox(
            height: 40,
          ),
          AppButton(
            text: 'SignUp',
            onPressed: () {
              Get.to(() => SignUp());
            },
            backgroundColor: Colors.green,
          ),
          AppButton(
              text: 'Login',
              onPressed: () {
                Get.to(() => LoginScreen());
              }),
        ],
      ),
    );
  }
}

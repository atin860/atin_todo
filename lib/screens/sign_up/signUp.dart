import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/screens/login_screen/login.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  MainController controller = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Sign Up'),
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
          AppTextfield(
            hintText: 'Enter your Name',
            labelText: 'Name',
          ),
          AppTextfield(
            controller: email,
            hintText: 'Enter your email',
            labelText: 'Email',
          ),
          AppTextfield(
            controller: password,
            hintText: 'Enter your password',
            labelText: 'Password',
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Our Todo App is a simple app that helps you to manage your daily tasks.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          AppButton(
            text: 'SignUp',
            onPressed: () {
              controller.signup(email.text, password.text);
            },
            backgroundColor: Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("already have an account?"),
            TextButton(
                onPressed: () {
                  Get.to(() => LoginScreen());
                },
                child: GestureDetector(
                  onTap: () => Get.to(() => LoginScreen()),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.bold),
                  ),
                ))
          ]),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/screens/login_screen/login.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widget/toast.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  MainController controller = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: MyAppBar(title: 'Sign Up'),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Welcome To\nOur\nDAILY TASK",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Our DAILY TASK is a simple app that helps you to manage your daily tasks.",
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
              controller: email,
              hintText: 'Enter your email',
              labelText: 'Email',
            ),
            AppTextfield(
              controller: password,
              hintText: 'Enter your password',
              labelText: 'Password',
            ),
            AppButton(
              text: 'SignUp',
              onPressed: () {
                if (validate())
                  controller.signup(email.text, password.text, name.text);
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
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ]),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  bool validate() {
    if (email.text.isEmpty) {
      showToastMessage('Please enter email.');
      return false;
    }
    if (password.text.isEmpty) {
      showToastMessage('Please enter password.');
      return false;
    }
    return true;
  }
}

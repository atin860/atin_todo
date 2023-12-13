import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/screens/forget_password/forget_password.dart';
import 'package:atin_todo/screens/sign_up/signUp.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MainController controller = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // hide keyboard when tap outside
      child: Scaffold(
        appBar: MyAppBar(title: 'Login'),
        body: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
              .onDrag, // hide keyboard when scrooll on screen
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: const Text(
                "This is your\nCommunity,\nhelp them to\ngrowmore",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Our community is your community too so let's help each other to grow more.",
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
              hintText: "Enter Your Email",
              labelText: "Email",
            ),
            AppTextfield(
              controller: password,
              hintText: "Enter Your Password",
              labelText: "Password",
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      Get.to(() => ForgetPassword());
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    )),
              ],
            ),
            AppButton(
                text: 'Login',
                onPressed: () {
                  if (validate()) controller.login(email.text, password.text);
                },
                backgroundColor: Colors.green),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Dont have an account?"),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignUp());
                  },
                  child: GestureDetector(
                    onTap: () => Get.to(() => SignUp()),
                    child: Text(
                      "Sign Up",
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

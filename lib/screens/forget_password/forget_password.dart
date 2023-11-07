import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  MainController controller = Get.find();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Forget Password'),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Helping others\nmeans helping\nyourself",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "If your are al;ways helping others, you are helping yourself too.",
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
            hintText: "Email",
            labelText: 'Enter Your Email',
          ),
          SizedBox(
            height: 40,
          ),
          AppButton(
              text: 'Send',
              onPressed: () {
                controller.forgetPassword(email.text);
              }),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

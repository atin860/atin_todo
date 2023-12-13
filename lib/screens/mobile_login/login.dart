import 'package:atin_todo/screens/mobile_login/otp.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus
            ?.unfocus(), // hide keyboard when tap outside
        child: Scaffold(
          appBar: MyAppBar(),
          body: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                .onDrag, // hide keyboard when scrooll on screen
            children: [
              Container(
                padding: const EdgeInsets.only(left: 30, top: 20),
                child: const Text(
                  "Enter Your\nMobile Number",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
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
                hintText: "+91",
                labelText: "Mobile Number",
              ),
              SizedBox(
                height: 50,
              ),
              AppButton(
                  text: "Send",
                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    Get.to(() => OtpScreen());
                  })
            ],
          ),
        ),
      ),
    );
  }
}

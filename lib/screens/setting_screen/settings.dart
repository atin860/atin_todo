import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/screens/personality_screen/personality_screen.dart';
import 'package:atin_todo/screens/setting_screen/language.dart';
import 'package:atin_todo/screens/setting_screen/term_condition.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  MainController controller = MainController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: ListView(
          padding: EdgeInsets.only(top: 60, left: 10, right: 10),
          children: [
            Text("Settings",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            SizedBox(
              height: 10,
            ),
            Text("Your Settings so that we are comfortabl",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                )),
            SizedBox(
              height: 50,
            ),
            HomeButtonWidget(
                data: 'Personality',
                textColor: Colors.black,
                bgColor: Colors.white,
                onTap: () {
                  Get.to(() => PerosnalityScreen());
                }),
            HomeButtonWidget(
                data: 'Language',
                textColor: Colors.black,
                bgColor: const Color.fromRGBO(255, 255, 255, 1),
                onTap: () {
                  Get.to(() => LanguageScreen());
                }),
            HomeButtonWidget(
                data: 'Terms & Conditions',
                textColor: Colors.black,
                bgColor: Colors.white,
                onTap: () {
                  Get.to(() => TermCOnditionScreen());
                }),
            SizedBox(
              height: 50,
            ),
            AppButton(
              text: 'Log Out',
              onPressed: () {
                controller.logout();
              },
              backgroundColor: Color.fromARGB(255, 198, 103, 96),
            )
          ],
        ));
  }
}

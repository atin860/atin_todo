import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';

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
          children: [
            Container(
              padding: EdgeInsets.only(left: 30, top: 80),
              child: Text(
                "Setting",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 300,
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

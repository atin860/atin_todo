import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: 'Language'),
        body: ListView(
          padding: EdgeInsets.only(top: 60, left: 10, right: 10),
          children: [
            Column(
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
                    data: 'Hindi',
                    bgColor: Color.fromARGB(255, 255, 243, 208),
                    textColor: Colors.amber,
                    onTap: () {}),
                HomeButtonWidget(
                    data: 'English',
                    bgColor: const Color.fromARGB(255, 218, 233, 245),
                    textColor: Colors.blue,
                    onTap: () {}),
              ],
            ),
          ],
        ));
  }
}

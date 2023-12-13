import 'package:atin_todo/screens/personality_screen/personality_screen.dart';
import 'package:atin_todo/screens/personality_screen/work_today_new.dart';
import 'package:atin_todo/screens/setting_screen/settings.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: Image.network(
                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Hello,",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text("Vsafe Software",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey))),
            SizedBox(
              height: 40,
            ),
            HomeButtonWidget(
                data: 'Personality',
                textColor: Colors.deepOrangeAccent,
                bgColor: Color.fromARGB(255, 255, 201, 155),
                icon: Icons.person_add,
                iconColor: Colors.black,
                onTap: () {
                  Get.to(() => PerosnalityScreen());
                }),
            HomeButtonWidget(
                data: 'Work Today',
                textColor: Color.fromARGB(255, 102, 14, 120),
                icon: Icons.work,
                iconColor: Colors.black,
                bgColor: Color.fromARGB(255, 225, 156, 212),
                onTap: () {
                  Get.to(() => AddTaskScreen());
                }),
            HomeButtonWidget(
                data: 'Settings',
                textColor: Color.fromARGB(255, 14, 120, 111),
                icon: Icons.settings,
                iconColor: Colors.black,
                bgColor: Color.fromARGB(255, 156, 220, 225),
                onTap: () {
                  Get.to(() => SettingScreen());
                }),
          ],
        ),
      ),
    );
  }
}

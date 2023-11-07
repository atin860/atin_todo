import 'package:atin_todo/screens/setting_screen/settings.dart';
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
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        children: [
          CircleAvatar(
            backgroundColor: Colors.greenAccent[400],
            radius: 70,
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
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 228, 206, 189),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(Icons.person_add),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Personality",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 187, 196, 230),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(Icons.file_copy),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Work Today's",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => SettingScreen());
            },
            child: Container(
                height: 50,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 172, 214, 225),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Setting",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 185, 236),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

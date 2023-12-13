import 'dart:developer';

import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/service/firebase_database.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:flutter/material.dart';

class PerosnalityScreen extends StatefulWidget {
  const PerosnalityScreen({super.key});
  @override
  State<PerosnalityScreen> createState() => _PerosnalityScreenState();
}

class _PerosnalityScreenState extends State<PerosnalityScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: MyAppBar(
            title: 'Personality',
          ),
          body: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              CircleAvatar(
                backgroundColor: Colors.greenAccent[400],
                radius: 70,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Edit Photo",
                style: TextStyle(color: Color.fromARGB(255, 255, 152, 34)),
              )),
              SizedBox(),
              AppTextfield(
                controller: userNameController,
                hintText: 'Enter Your Name',
                labelText: 'User Name',
              ),
              AppTextfield(
                controller: emailController,
                hintText: 'Enter Your Email',
                labelText: 'Email',
              ),
              AppTextfield(
                controller: hobbyController,
                hintText: 'Enter Your HObbies',
                labelText: 'Hobbies',
              ),
              AppTextfield(
                controller: ageController,
                hintText: 'Enter Your Age',
                labelText: 'Age',
              ),
              AppTextfield(
                controller: cityController,
                hintText: 'Enter your City',
                labelText: 'City',
              ),
              AppButton(
                  text: 'Change save',
                  onPressed: () async {
                    addUser();
                  })
            ],
          ),
        ));
  }

  void addUser() async {
    FocusManager.instance.primaryFocus!.unfocus();

    Map<String, dynamic> user = {
      "userName": userNameController.text,
      "Email": emailController.text,
      "hobbies": hobbyController.text,
      "age": int.parse(ageController.text.trim()),
      "city": cityController.text,
      "userId": auth.currentUser!.uid
    };
    log("befor adding user:");

    Map? res = await FireStoreService.addUser(user);
    if (res == null) {
      log("error aaddd ni hua");
      log("after addig error addd ni hua");
    }
    log("after adding:" + addUser.toString());
    setState(() {
      userNameController.clear();
      emailController.clear();
      hobbyController.clear();
      ageController.clear();
      cityController.clear();
    });
    log('data: $user');
  }
}

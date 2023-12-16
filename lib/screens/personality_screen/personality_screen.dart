import 'dart:developer';
import 'dart:io';

import 'package:atin_todo/controller/controller.dart';
import 'package:atin_todo/service/firebase_database.dart';
import 'package:atin_todo/widget/app_button.dart';
import 'package:atin_todo/widget/appbar.dart';
import 'package:atin_todo/widget/textfield.dart';
import 'package:atin_todo/widget/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker imgpicker = ImagePicker();
  File? pickedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

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
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                        child: pickedImage != null
                            ? Image.file(
                                pickedImage!,
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://t3.ftcdn.net/jpg/05/56/29/10/360_F_556291020_q2ieMiOCKYbtoLITrnt7qcSL1LJYyWrU.jpg',
                                width: 150,
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          imagePickerOption();
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
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

  void pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
    successMessage("Update Image");
  }

  void getUser() async {
    Map data = await FireStoreService.getUser();
    if (data.isNotEmpty) {
      setState(() {
        userNameController.text = data['userName'];
        emailController.text = data['Email'];
        hobbyController.text = data['hobbies'];
        cityController.text = data['city'];
        ageController.text = data[int.parse('age')];
      });
    }
  }

  void addUser() async {
    FocusManager.instance.primaryFocus!.unfocus();

    Map<String, dynamic> users = {
      "userName": userNameController.text,
      "hobbies": hobbyController.text,
      "age": int.parse(ageController.text.trim()),
      "city": cityController.text,
      "userId": auth.currentUser!.uid
    };
    log("befor adding user:");

    Map? res = await FireStoreService.addUser(users);
    if (res == null) {
      log("after addig error addd ni hua");
    }

    log("after adding:" + addUser.toString());
    successMessage("Successfully Updated,");
    setState(() {
      userNameController.clear();
      emailController.clear();
      hobbyController.clear();
      ageController.clear();
      cityController.clear();
    });
    log('data: $users');
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

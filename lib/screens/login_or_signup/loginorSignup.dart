import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Login or Signup'),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Welcome To\nOur\nTodo App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              "Our Todo App is a simple app that helps you to manage your daily tasks.",
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
          Center(
              child: Text(
            "Get in touch with us",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )),
          SizedBox(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 175, 162, 76),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                textStyle: const TextStyle(
                  fontSize: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

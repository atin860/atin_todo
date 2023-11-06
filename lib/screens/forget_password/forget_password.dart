import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Email',
              hintText: 'Enter your email',
            )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Next'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
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
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

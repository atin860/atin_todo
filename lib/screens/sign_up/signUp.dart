import 'package:atin_todo/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Sign Up'),
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
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Name',
              hintText: 'Enter your name',
            )),
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
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              labelText: 'Password',
              hintText: 'Enter your password',
            )),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              "Our Todo App is a simple app that helps you to manage your daily tasks.",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("already have an account?"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ))
          ]),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

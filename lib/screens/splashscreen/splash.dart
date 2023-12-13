import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100, left: 40, right: 40),
            padding: EdgeInsets.all(30),
            child: Image.asset("assets/images/img_logo.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Daily",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1)),
              SizedBox(
                width: 10,
              ),
              Text("Task",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepOrange,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1)),
            ],
          ),
          Text("...",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 34, 255, 78),
                  fontFamily: 'Pacifico',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10)),
        ],
      ),
    );
  }
}

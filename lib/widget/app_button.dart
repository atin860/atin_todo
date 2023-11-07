import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.text,
      this.backgroundColor,
      required this.onPressed});
  final String text;
  final Color? backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              backgroundColor ?? const Color.fromARGB(255, 76, 106, 175),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          textStyle: const TextStyle(
            fontSize: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

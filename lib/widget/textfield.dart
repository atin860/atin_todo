import 'package:flutter/material.dart';

class AppTextfield extends StatefulWidget {
  const AppTextfield({
    super.key,
    this.labelText,
    this.controller,
    this.hintText,
    this.borderRadius,
  });
  final String? labelText;
  final String? hintText;
  final BorderRadius? borderRadius;
  final TextEditingController? controller;

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
            ),
            labelText: widget.labelText,
            hintText: widget.hintText,
          )),
    );
  }
}

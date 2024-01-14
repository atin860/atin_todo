import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextfield extends StatefulWidget {
  const AppTextfield({
    super.key,
    this.labelText,
    this.controller,
    this.hintText,
    this.borderRadius,
    this.errorText,
    this.keyboardType,
  });
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final BorderRadius? borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  State<AppTextfield> createState() => _AppTextfieldState();
}

class _AppTextfieldState extends State<AppTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
          inputFormatters: [UpperCaseTextFormatter()],
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
              ),
              labelText: widget.labelText,
              hintText: widget.hintText,
              errorText: widget.errorText)),
    );
  }
}

// UPPERCASE WORD CLASS
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
        text: newValue.text.toUpperCase(), selection: newValue.selection);
  }
}

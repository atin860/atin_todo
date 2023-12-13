import 'package:flutter/material.dart';

//App button widget
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
  });
  final String text;
  final Color? backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
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

//home button widget
class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({
    super.key,
    this.icon,
    required this.data,
    this.textColor,
    this.bgColor,
    this.iconColor,
    required this.onTap,
  });
  final String data;
  final Function() onTap;
  final IconData? icon;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 50,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: bgColor ?? Color.fromARGB(255, 12, 126, 226),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                  offset: Offset(0, 0.5), // changes position of shadow
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                ),

              Expanded(
                child: Text(
                  data,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
              ),
            ],
          )),
    );
  }
}

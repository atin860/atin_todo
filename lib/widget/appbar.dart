import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.title, this.actions, this.isBackButton});
  final String? title;
  final List<Widget>? actions;
  final bool? isBackButton;

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: widget.title != null
            ? Text(widget.title ?? "", style: TextStyle(color: Colors.black))
            : null,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        actions: widget.actions,
        leading: Center(
          child: Row(
            children: [
              if (widget.isBackButton == null)
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 25,
                    width: 25,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        // borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: SvgPicture.asset(
                      'assets/images/img_arrow_left.svg',
                      width: 8,
                      // Specify the width
                      // height: 10,
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}

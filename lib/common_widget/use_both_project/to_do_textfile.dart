import 'package:flutter/material.dart';
import 'package:to_do_self_project/utils/use_both_project/global.dart';

class ToDoTextfile extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final bool? enable;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  const ToDoTextfile(
      {Key? key,
      this.controller,
      this.hintText,
      this.enable,
      this.suffixIcon,
      this.maxLines,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        enabled: enable ?? true,
        controller: controller,
        cursorColor: const Color(0xff383c42),
        maxLines: maxLines,
        onTap: onTap,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff383c42),
            fontSize: 14,
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xffefe6fa),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              // color: Color(0xff383c42),
              color: Global.bgColour,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}

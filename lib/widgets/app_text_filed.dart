import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFiled extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final IconButton? suffixIcon;
  final int maxLine;


  AppTextFiled({
    required this.textEditingController,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLine = 1,
  });

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLine,
      decoration: InputDecoration(
        enabledBorder: getBorder(borderColor: const Color(0xffD0D0D0)),
        focusedBorder: getBorder(borderColor: const Color(0xff6A90F2)),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff9391A4)),
        hintMaxLines: 1,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }

  OutlineInputBorder getBorder({Color borderColor = Colors.grey}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: borderColor,
          width: 2,
        ));
  }
}

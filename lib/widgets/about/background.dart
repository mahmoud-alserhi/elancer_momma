import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container background() {
  return Container(
    height: 200.h,
    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.w),
    decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill,
        ),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 3),
          blurRadius: 8,
          color: const Color(0xffD0D0D0)
        ),
      ]
    ),
  );
}
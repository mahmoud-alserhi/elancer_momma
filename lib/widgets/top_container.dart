import 'package:elancer_momma/constanse/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container personalInformation() {
  return Container(
    height: 350.h,
    padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 15.w),
    decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background1.jpg'),
          fit: BoxFit.fill,
        )),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("my_photo"),
          radius: 70,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          'Mahmoud Maher Alserhi',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 19.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          "Flutter Developer",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14.sp,
            color: const Color(0xff716F87),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('facebook_icon'),
              backgroundColor: Color(0xffFFFFFF),
              radius: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('insta_icon'),
              backgroundColor: Color(0xffFFFFFF),
              radius: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('github_icon'),
              backgroundColor: Color(0xffFFFFFF),
              radius: 20,
            ),
          ],
        )
      ],
    ),
  );
}
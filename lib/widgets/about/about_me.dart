import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container aboutMe() {
  return Container(
    // alignment: AlignmentDirectional.centerStart,
    height: 200.h,
    padding: EdgeInsets.symmetric(
      horizontal: 10.h,
      vertical: 10.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 19.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Mahmoud Alserhi is a student of eLancer, with experience developer mobile application. Mahmoud fuels her passion for understanding the nuances of professional application development. He eager to both build on her academic foundations in application development sciences and stay in tune with the latest flutter strategies through continued coursework.',
          textAlign: TextAlign.start,
          maxLines: 6,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18.sp,
            color: const Color(0xff716F87),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 330.w,
            height: 330.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xff23203F),fontFamily: 'Nunito',fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontFamily: 'Nunito',fontSize: 22,color: Color(0xff716F87)),
          ),
        ],
      ),
    );
  }
}

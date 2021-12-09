import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardCategorise extends StatelessWidget {
  const CardCategorise({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(

        color: const Color(0xffF0F1F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            child: Image.network(
              image,
              // 'assets/images/Clip.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffe6e4fa),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
            ),
            height: 40.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
              child: Text(
                title,
                // "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                // textAlign: TextAlign.right,
                maxLines: 1,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18.sp,
                  color: const Color(0xff23203F),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
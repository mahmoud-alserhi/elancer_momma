import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingIndicator extends StatelessWidget {
  const OutBoardingIndicator({
    Key? key,
    this.marginEnd = 0,
    required this.selected,
  }) : super(key: key);

  final double marginEnd;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: selected ? 25.w : 10.w,
      height: 5.h,
      decoration: BoxDecoration(
          color: selected ? const Color(0xff6A90F2) : const Color(0xff9391A4),
          borderRadius: BorderRadius.circular(24)
      ),
    );
  }
}

//0F62AC -> dark blue
//02A3E4 -> light blue
//078CD1 -> light blue
//F58634 -> dark oranges
//FDBE2B -> light oranges
//D1D5DB -> gray
//EF4444 -> red
//34D399 -> green

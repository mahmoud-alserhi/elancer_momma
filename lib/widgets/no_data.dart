import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Center widgetNoData() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/noData.png'),
        const Text(
          'Oops! Its Empty!',
          style: TextStyle(
            color: Color(0xff23203F),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
            height: 10.h
        ),
        const Text(
          'There are no products under this\ncategory right now.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff23203F),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
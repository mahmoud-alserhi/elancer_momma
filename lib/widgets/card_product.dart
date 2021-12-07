import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    this.isFavorite = false,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final String price;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF0F1F6),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: const Color(0xffFF0000),
                  size: 30,
                ),
              ),
            ),
          ),
          Image.asset(
            image,
            // 'assets/images/Clip.png',
            fit: BoxFit.fitHeight,
            height: 200,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffe6e4fa),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            height: 50.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        // "Lorem Ipsum is",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16.sp,
                          color: const Color(0xff23203F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        price,
                        // "\$10.00",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 15.sp,
                          color: const Color(0xff716F87),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subTitle,
                        // "subTitle",
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16.sp,
                          color: const Color(0xff716F87),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        updateOnDrag: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
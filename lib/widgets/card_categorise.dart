import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardCategorise extends StatelessWidget {
  const CardCategorise({
    Key? key,
    required this.image,
    required this.title,
    this.subCategory = 0,
    this.productCount = 0,
  }) : super(key: key);

  final String image;
  final String title;
  final int subCategory;
  final int productCount;

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
          SizedBox(
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
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            height: 55.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 127.w,
                        child: Text(
                          title,
                          // "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                          // textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16.sp,
                            color: const Color(0xff23203F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.subCategories}: $subCategory',
                        // overflow: TextOverflow.ellipsis,
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16.sp,
                          color: const Color(0xff716F87),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // SizedBox(width: 10.w,),
                      // Expanded(
                      //   child: Text(
                      //     'Product: $productCount',
                      //     // overflow: TextOverflow.ellipsis,
                      //     // overflow: TextOverflow.clip,
                      //     maxLines: 1,
                      //     textAlign: TextAlign.end,
                      //     style: TextStyle(
                      //       fontFamily: 'Nunito',
                      //       fontSize: 16.sp,
                      //       color: const Color(0xff716F87),
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
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

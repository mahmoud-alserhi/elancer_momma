import 'package:elancer_momma/api/controllers/favorite_product_api_controller.dart';
import 'package:elancer_momma/get/favorite_product_getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardProduct extends StatefulWidget {
  const CardProduct({
    Key? key,
    required this.id,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.isFavorite,
    this.overalRate = 0,
    this.favoriteButton = false,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final String price;
  final num overalRate;
  final bool isFavorite;
  final int id;
  final bool favoriteButton;


  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {

  late bool _isFavorite = false;

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
              widget.image,
              // 'assets/images/Clip.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              child: widget.favoriteButton ? IconButton(
                onPressed: () {
                  FavoriteProductApiController().postFavorite(
                      context,
                      productId: widget.id);
                  FavoriteProductGetxController.to.getFavoriteProduct();
                  setState(() {
                    _isFavorite
                        ? _isFavorite = false
                        : _isFavorite = true;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  // isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: _isFavorite || widget.isFavorite ? const Color(0xffFF0000) : const Color(0xffB0B0B0),
                  // color: const Color(0xffFF0000),
                  size: 30,
                ),
              ) : SizedBox(),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffe6e9fa),
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
                      SizedBox(
                        height: 21.h,
                        width: 150.w,
                        child: Text(
                          widget.title,
                          // "Lorem Ipsum is",
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16.sp,
                            color: const Color(0xff23203F),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Price \$${widget.price}',
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
                      SizedBox(
                        height: 25.h,
                        width: 163.w,
                        child: Text(
                          '${widget.subTitle}...',
                          // "subTitle",
                          overflow: TextOverflow.ellipsis,
                          // overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 16.sp,
                            color: const Color(0xff716F87),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Row(
                            children: [
                              Text(
                                '${widget.overalRate}',
                                // "overal rate",
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 16.sp,
                                  color: const Color(0xff716F87),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 2.w,),
                              Icon(Icons.star,color: Colors.amber,size: 18.w,),
                            ],
                          ),
                        ],
                      ),

                      // RatingBar.builder(
                      //   initialRating: 0,
                      //   minRating: 1,
                      //   direction: Axis.horizontal,
                      //   allowHalfRating: true,
                      //   itemCount: 5,
                      //   itemSize: 22,
                      //   updateOnDrag: true,
                      //   itemBuilder: (context, _) => const Icon(
                      //     Icons.star,
                      //     color: Colors.amber,
                      //   ),
                      //   onRatingUpdate: (rating) {
                      //     print(rating);
                      //   },
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

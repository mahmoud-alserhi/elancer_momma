import 'package:card_swiper/card_swiper.dart';
import 'package:elancer_momma/models/api/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({Key? key,required this.product}) : super(key: key);
  final Product product;

  @override
  _DetailProductScreenState createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff23203f),
          ),
        ),
        title: Text(
          // AppLocalizations.of(context)!.home,
          'Details Product',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 25.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, '/favorite_screen');
          //   },
          //   icon: const Icon(
          //     Icons.favorite,
          //     color: Color(0xffFF0000),
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.language,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 20.w),
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 10.h,
              maxHeight: 200.h,
              minWidth: double.infinity,
            ),
            child: Swiper(
                    duration: 500,
                    autoplay: true,
                    itemCount: widget.product.imageUrl.length,
                    viewportFraction: 0.7,
                    scale: 0.8,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: SizedBox(
                                  height: 200.h,
                                  width: double.infinity,
                                  child: Image.network(
                                    widget.product.imageUrl,
                                    // widget.product.imageUrl[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.product.productName,
                        // "Lorem Ipsum is",
                        // overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 19.sp,
                          color: const Color(0xff23203F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "\$${widget.product.price}",
                      // "\$10.00",
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 19.sp,
                        color: const Color(0xff23203F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantity: ${widget.product.quantity}',
                      // 'Quantity: 5',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20.sp,
                        color: const Color(0xff6A90F2),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Item Description:',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20.sp,
                        color: const Color(0xff23203F),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              // _isFavorite
                              // // widget.isFavorite
                              //     ? _isFavorite = false
                              //     : _isFavorite = true;
                            });
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            // color: _isFavorite ? Colors.red : const Color(0xffB0B0B0),
                            // color: const Color(0xffFF0000),
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 7.w,),
                        Text(
                          '${widget.product.overalRate}',
                          // "overal rate",
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            color: const Color(0xff716F87),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Icon(Icons.star,color: Colors.amber,size: 24.w,),
                      ],
                    ),
                  ],
                ),
                Text(
                  widget.product.infoProduct,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 50,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 20.sp,
                    color: const Color(0xff716F87),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

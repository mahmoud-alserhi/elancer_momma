import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsProductScreen extends StatefulWidget {
  const DetailsProductScreen({Key? key}) : super(key: key);

  @override
  _DetailsProductScreenState createState() => _DetailsProductScreenState();
}

class _DetailsProductScreenState extends State<DetailsProductScreen> {
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
          ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Color(0xffFF0000),
            ),
          ),
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
              // onTap: (value){},
              duration: 500,
              autoplay: true,
              itemCount: 10,
              viewportFraction: 0.7,
              scale: 0.9,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Image.network(
                          "http://www.hoko.pk/wp-content/uploads/2017/10/FHB-101-1.jpg",
                          fit: BoxFit.fitHeight,
                          height: 200,
                          width: 300,
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
                    Text(
                      "Lorem Ipsum is",
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 22.sp,
                        color: const Color(0xff23203F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$10.00",
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 22.sp,
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
                      'Quantity: 5',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20.sp,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Item Description:',
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20.sp,
                        color: const Color(0xff716F87),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Color(0xffFF0000),
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry`s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 15,
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

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu_rounded,
            color: Color(0xff23203f),
          ),
        ),
        title: Text(
          // AppLocalizations.of(context)!.home,
            'Home',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25.sp,
              color: const Color(0xff23203F),
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      body: Swiper(
        // onTap: (value){},
        duration: 500,
        autoplay: false,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(180, 255, 255, 255),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                    ),
                    height: 70.h,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                          // textAlign: TextAlign.right,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: 10,
        viewportFraction: 0.7,
        scale: 0.9,
      ),
      // body: ListView(
      //   padding: EdgeInsets.symmetric(vertical: 20.w),
      //   children: [
      //     // Swiper(
      //     //   autoplay: true,
      //     //   itemBuilder: (BuildContext context, int index) {
      //     //     return Container(
      //     //       height: 190,
      //     //       child: Stack(
      //     //         alignment: AlignmentDirectional.bottomStart,
      //     //         children: [
      //     //           new Image.network(
      //     //             "https://images.unsplash.com/photo-1595445364671-15205e6c380c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=764&q=80",
      //     //             fit: BoxFit.fitHeight,
      //     //           ),
      //     //           Wrap(children: [
      //     //             Container(
      //     //               height: 100,
      //     //               alignment: Alignment.bottomCenter,
      //     //               color: Color.fromARGB(170, 255, 255, 255),
      //     //               child: Padding(
      //     //                 padding: EdgeInsets.all(5),
      //     //                 child: Text(
      //     //                     "تحت رعاية رئيس متابعة العمل الحكومي وزارة التعليم بغزة تفتتح مدرسة اليرموك الثانوية للبنين",
      //     //                     textAlign: TextAlign.right,
      //     //                     maxLines: 2,
      //     //                     style: TextStyle(
      //     //                         fontSize: 15, fontWeight: FontWeight.bold)),
      //     //               ),
      //     //             ),
      //     //           ])
      //     //         ],
      //     //       ),
      //     //     );
      //     //   },
      //     //   itemCount: 10,
      //     //   viewportFraction: 0.7,
      //     //   scale: 0.9,
      //     // ),
      //     SizedBox(height: 20.h,),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.h),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Categorise',
      //             style: TextStyle(
      //                 fontFamily: 'Nunito',
      //                 fontSize: 22.sp,
      //                 color: const Color(0xff23203f),
      //                 fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text(
      //               'View All',
      //               style: TextStyle(
      //                   fontFamily: 'Nunito',
      //                   color: const Color(0xff6A90F2),
      //                   fontWeight: FontWeight.bold,
      //                   fontSize: 18.sp,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     ConstrainedBox(
      //       constraints: BoxConstraints(
      //         minHeight: 10.h,
      //         maxHeight: 252.h,
      //         minWidth: double.infinity,
      //       ),
      //       child: GridView.builder(
      //         padding: EdgeInsets.symmetric(horizontal: 20.h),
      //         itemCount: 10,
      //         shrinkWrap: true,
      //         scrollDirection: Axis.horizontal,
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 1,
      //             mainAxisSpacing: 20,
      //             childAspectRatio: 212 / 141),
      //         itemBuilder: (context, index) {
      //           return const Card(
      //             elevation: 8,
      //           );
      //         },
      //       ),
      //     ),
      //     SizedBox(height: 20.h,),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Latest Products',
      //             style: TextStyle(
      //               fontFamily: 'Nunito',
      //               fontSize: 22.sp,
      //               color: const Color(0xff23203f),
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text(
      //               'View All',
      //               style: TextStyle(
      //                 fontFamily: 'Nunito',
      //                 color: const Color(0xff6A90F2),
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18.sp,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     ConstrainedBox(
      //       constraints: BoxConstraints(
      //         minHeight: 10.h,
      //         maxHeight: 252.h,
      //         minWidth: double.infinity,
      //       ),
      //       child: GridView.builder(
      //         padding: EdgeInsets.symmetric(horizontal: 20.h),
      //         itemCount: 10,
      //         shrinkWrap: true,
      //         scrollDirection: Axis.horizontal,
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 1,
      //             mainAxisSpacing: 19,
      //             childAspectRatio: 212 / 141),
      //         itemBuilder: (context, index) {
      //           return const Card(
      //             elevation: 8,
      //           );
      //         },
      //       ),
      //     ),
      //     SizedBox(height: 20.h,),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 20.w),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Text(
      //             'Products you may like',
      //             style: TextStyle(
      //               fontFamily: 'Nunito',
      //               fontSize: 22.sp,
      //               color: const Color(0xff23203f),
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           TextButton(
      //             onPressed: () {},
      //             child: Text(
      //               'View All',
      //               style: TextStyle(
      //                 fontFamily: 'Nunito',
      //                 color: const Color(0xff6A90F2),
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 18.sp,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     ConstrainedBox(
      //       constraints: BoxConstraints(
      //         minHeight: 10.h,
      //         maxHeight: 252.h,
      //         minWidth: double.infinity,
      //       ),
      //       child: GridView.builder(
      //         padding: EdgeInsets.symmetric(horizontal: 20.h),
      //         itemCount: 10,
      //         shrinkWrap: true,
      //         scrollDirection: Axis.horizontal,
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 1,
      //             mainAxisSpacing: 19,
      //             childAspectRatio: 212 / 141),
      //         itemBuilder: (context, index) {
      //           return const Card(
      //             elevation: 8,
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

import 'package:elancer_momma/widgets/out_boarding_content.dart';
import 'package:elancer_momma/widgets/out_boarding_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Visibility(
              visible: _currentPage < 2,
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: TextButton(
                onPressed: () => _pageController.animateToPage(2,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut),
                child: Text(
                  AppLocalizations.of(context)!.skip,
                  // 'Skip',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff6A90F2),
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.w,
              maxWidth: double.infinity,
              minHeight: 0.h,
              maxHeight: 580.h,
            ),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                OutBoardingContent(
                  image: 'assets/images/out_boarding_image1.png',
                  title: AppLocalizations.of(context)!.pageOneTitle,
                  // title: 'Welcome!',
                  description:
                  AppLocalizations.of(context)!.pageOneDescription,
                      // 'Welcome to Momma shop,Everything you need is here, Just take your time.',
                ),
                OutBoardingContent(
                  image: 'assets/images/out_boarding_image2.png',
                  title: AppLocalizations.of(context)!.pageTwoTitle,
                  // title: 'Add to cart',
                  description:
                  AppLocalizations.of(context)!.pageTwoDescription,
                      // 'Shop everything you want,\nAnd Add to cart, It`s an easy way.',
                ),
                OutBoardingContent(
                  image: 'assets/images/out_boarding_image3.png',
                  title: AppLocalizations.of(context)!.pageThreeTitle,
                  // title: 'Enjoy Purchase!',
                  description:
                  AppLocalizations.of(context)!.pageThreeDescription,
                      // 'You can purchase on Momma.\nDuring checkout,Select the timeframe',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutBoardingIndicator(
                marginEnd: 10,
                selected: _currentPage == 0,
              ),
              OutBoardingIndicator(
                marginEnd: 10,
                selected: _currentPage == 1,
              ),
              OutBoardingIndicator(
                selected: _currentPage == 2,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: _currentPage == 2,
            maintainSize: true,
            maintainState: true,
            maintainAnimation: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff6A90F2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r)),
                  minimumSize: Size(165.w, 56.h),
                ),
                child: Text(
                  AppLocalizations.of(context)!.getStart,
                  // 'Get Start',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

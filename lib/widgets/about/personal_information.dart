import 'package:elancer_momma/widgets/about/about_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_me.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Container personalInformation(BuildContext context) {
  return Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120.h,
        ),
        CircleAvatar(
          backgroundImage: const AssetImage('assets/images/me.jpg'),
          radius: 65.h,
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          AppLocalizations.of(context)!.mahmoud,
          // 'Mahmoud Maher Alserhi',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 19.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          AppLocalizations.of(context)!.flutter,
          // "Flutter Developer",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 14.sp,
            color: const Color(0xff716F87),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/facebook_icon.png'),
              backgroundColor: const Color(0xffFFFFFF),
              radius: 20.h,
              child: GestureDetector(
                onTap: () async {
                  await launch('https://www.facebook.com/Mahmoud.Alserhi.99/');
                },
              ),
            ),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/instagram_icon.png'),
              backgroundColor: const Color(0xffFFFFFF),
              radius: 20.h,
              child: GestureDetector(
                onTap: () async {
                  await launch('https://www.instagram.com/mahmoudalserhi/');
                },
              ),
            ),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/images/github_icon.png'),
              backgroundColor: const Color(0xffFFFFFF),
              radius: 20.h,
              child: GestureDetector(
                onTap: () async {
                  await launch('https://github.com/mahmoud-alserhi/elancer_momma');
                },
              ),
            ),
          ],
        ),
        SizedBox(
            height: 10.h
        ),
        aboutMe(context),
        aboutApp(context),
        SizedBox(
            height: 20.h
        ),
      ],
    ),
  );
}



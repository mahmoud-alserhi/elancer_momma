import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Container aboutApp(BuildContext context) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    height: 300.h,
    padding: EdgeInsets.symmetric(
      horizontal: 10.h,
      vertical: 10.w,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppLocalizations.of(context)!.aboutApp}:',
          // 'About Application:',
          textAlign: TextAlign.start,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 19.sp,
            color: const Color(0xff23203F),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.aboutAppDes,
          // 'Our main mission is the ultimate in design, Embodying the distinctive styles of an individual. We pair our understanding of the symbiosis between face shape, hair texture, and length with a broad range of materials and innovative techniques to create pieces that are not only beautiful but exquisitely crafted and functional, leaving our customers feeling stylish and elegant.',
          textAlign: TextAlign.start,
          maxLines: 10,
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 18.sp,
            color: const Color(0xff716F87),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
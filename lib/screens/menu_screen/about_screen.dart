import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/widgets/about/background.dart';
import 'package:elancer_momma/widgets/about/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {


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
          AppLocalizations.of(context)!.about,
          // 'About',
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
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Future.delayed(const Duration(microseconds: 800), () {
                Navigator.pushNamed(context, '/settings_screen');
              });
            },
            icon: const Icon(
              Icons.settings_rounded,
              color: Color(0xff23203f),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              background(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: personalInformation(context),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

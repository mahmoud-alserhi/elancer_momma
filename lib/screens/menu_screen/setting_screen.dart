import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/widgets/restart_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
          AppLocalizations.of(context)!.setting,
          // 'FAQs',
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
              Navigator.pushNamed(context, '/favorite_screen');
            },
            icon: const Icon(
              Icons.favorite,
              color: Color(0xffFF0000),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return buildAlertDialog(context);
                    },
                  );
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(flag()),
                  radius: 25,
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  AppLocalizations.of(context)!.language,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 22.sp,
                    color: const Color(0xff23203F),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      content: Container(
        height: 200.h,
        width: 280.w,
        color: Colors.white,
        child: Stack(
          children: [
            Form(
              // key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    child: Text(
                      AppLocalizations.of(context)!.chooseLanguage,
                      // 'Choose Language',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18.sp,
                        color: const Color(0xff23203F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  Divider(height: 10.h,),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  const AssetImage('assets/images/saudi_arabia_flag.png'),
                              backgroundColor: Colors.transparent,
                              radius: 35.h,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              AppLocalizations.of(context)!.arabic,
                                // 'Arabic',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18.sp,
                                color: const Color(0xff23203F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          if (LanguageGetxController.to.language == 'en') {
                          Future.delayed(const Duration(milliseconds: 200),(){
                            setState(() {
                              LanguageGetxController.to.changeLanguage();
                              // Navigator.pop(context);
                              RestartWidget.restartApp(context);
                            });
                          });
                          }
                        },
                      ),
                      // SizedBox(width: 30),
                      InkWell(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  const AssetImage('assets/images/usa_flag.jpeg'),
                              backgroundColor: Colors.transparent,
                              radius: 35.h,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              AppLocalizations.of(context)!.english,
                                // 'English',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 18.sp,
                                color: const Color(0xff23203F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        onTap: () {
                          if (LanguageGetxController.to.language == 'ar') {
                            Future.delayed(const Duration(milliseconds: 200),(){
                              setState(() {
                                LanguageGetxController.to.changeLanguage();
                                // Navigator.pop(context);
                                RestartWidget.restartApp(context);
                              });
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String flag() {
    if (LanguageGetxController.to.language == 'en') {
      return 'assets/images/usa_flag.jpeg';
    } else {
      return 'assets/images/saudi_arabia_flag.png';
    }
  }
}

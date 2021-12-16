import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:elancer_momma/api/controllers/contact_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> with Helpers{

  late TextEditingController _subjectTextEditingController;
  late TextEditingController _messageTextEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _subjectTextEditingController = TextEditingController();
    _messageTextEditingController = TextEditingController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _subjectTextEditingController.dispose();
    _messageTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff23203F),
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.contactUs,
            // 'Contact Us',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25.sp,
              color: const Color(0xff23203F),
              fontWeight: FontWeight.bold,
            )),
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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Text(
            AppLocalizations.of(context)!.suggestionsTitle,
            // 'Suggestions and complaints',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 25.sp,
                color: const Color(0xff23203F),
                fontWeight: FontWeight.bold),
          ),
          Text(
            AppLocalizations.of(context)!.suggestionsSubTitle,
            // 'We would like to receive your suggestions?',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18.sp,
              color: const Color(0xff716F87),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 38.h,
          ),
          AppTextFiled(
            textEditingController: _subjectTextEditingController,
            hintText: AppLocalizations.of(context)!.subject,
            // hintText: 'Subject',
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
              textEditingController: _messageTextEditingController,
              hintText: AppLocalizations.of(context)!.message,
              // hintText: 'Message',
              textInputType: TextInputType.text,
            maxLine: 7,
            ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () async => await performContact(),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(double.infinity, 56.h),
            ),
            child: Text(
              AppLocalizations.of(context)!.send,
              // 'Send',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> performContact() async {
    if (checkData()) {
      await contact();
    }
  }

  bool checkData() {
    if (_subjectTextEditingController.text.isNotEmpty &&
        _messageTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> contact() async {
    bool status = await Contact().sendMessage(
        context,
        subject: _subjectTextEditingController.text,
        message: _messageTextEditingController.text
    );
    if (status) Navigator.pushReplacementNamed(context, '/contact_screen');
  }

}

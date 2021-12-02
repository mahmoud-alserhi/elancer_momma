import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController _mobileTextEditingController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextEditingController.dispose();
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
          // AppLocalizations.of(context)!.forgetPassword,
            'Forget Password',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25.sp,
              color: const Color(0xff23203F),
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
        children: [
          SvgPicture.asset(
            'assets/images/forgot_password_image.svg',
            width: 210.w,
            height: 200.h,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            // AppLocalizations.of(context)!.forgetTitle,
            'We have sent a Code recover instructions to your Mobile',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20.sp,
                color: const Color(0xff716F87),
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 32.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextFiled(
            textEditingController: _mobileTextEditingController,
            // hintText: AppLocalizations.of(context)!.mobile,
            hintText: 'Mobil',
            textInputType: TextInputType.phone,
          ),
          SizedBox(
            height: 200.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/reset_password_screen');
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(double.infinity, 56.h),
            ),
            child: Text(
              // AppLocalizations.of(context)!.sendCode,
              'Send Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  
}

import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;

  late bool _isPasswordShow;

  late TapGestureRecognizer _tapGestureRecognizer;

  void navigateToRegisterScreen() {
    Navigator.pushNamed(context, '/register_screen');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    _isPasswordShow = true;

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToRegisterScreen;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          SizedBox(
            height: 138.h,
          ),
          Text(
            // AppLocalizations.of(context)!.singIn,
            'Sing In',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 30.sp,
                color: const Color(0xff23203F),
                fontWeight: FontWeight.bold),
          ),
          Text(
            // AppLocalizations.of(context)!.singIn,
            'Login to continue your account,',
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
            textEditingController: _mobileTextEditingController,
            hintText: 'Mobile',
            textInputType: TextInputType.phone,
          ),
          SizedBox(
            height: 31.h,
          ),
          AppTextFiled(
            textEditingController: _mobileTextEditingController,
            hintText: 'Password',
            textInputType: TextInputType.text,
            obscureText: _isPasswordShow,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordShow = !_isPasswordShow;
                });
              },
              icon: Icon(
                  _isPasswordShow
                      ? Icons.visibility
                      : Icons.visibility_off,
                color: const Color(0xff6A90F2),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(double.infinity, 56.h),
            ),
            child: Text(
              'Sing In',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Don`t have an account? ',
                style: TextStyle(
                  color: const Color(0xff23203F),
                  fontFamily: 'Nunito',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,),
                children: [
                  TextSpan(
                    recognizer: _tapGestureRecognizer,
                    text: 'Sing Up!',
                    style: TextStyle(
                      color: Color(0xff6A90F2),
                      fontFamily: 'Nunito',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
          ),
          TextButton(
            onPressed: (){
              Navigator.pushNamed(context, '/forget_password_screen');
            },
            child: Text('Forget Password?',
                style: TextStyle(
              color: const Color(0xff6A90F2),
              fontFamily: 'Nunito',
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            )),
          ),
        ],
      ),
    );
  }
}
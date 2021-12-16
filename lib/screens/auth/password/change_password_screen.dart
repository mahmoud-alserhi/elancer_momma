import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:elancer_momma/widgets/code_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({
    Key? key,
  }) : super(key: key);


  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    with Helpers {

  late TextEditingController _currentPasswordTextEditingController;
  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _newPasswordConfirmationTextEditingController;
  late bool _isPasswordShow1;
  late bool _isPasswordShow2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentPasswordTextEditingController = TextEditingController();
    _newPasswordTextEditingController = TextEditingController();
    _newPasswordConfirmationTextEditingController = TextEditingController();
    _isPasswordShow1 = true;
    _isPasswordShow2 = true;

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _currentPasswordTextEditingController.dispose();
    _newPasswordTextEditingController.dispose();
    _newPasswordConfirmationTextEditingController.dispose();

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
          AppLocalizations.of(context)!.changePassword,
            // 'Change Password',
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
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          SizedBox(
            height: 50.h,
          ),
          Text(
            AppLocalizations.of(context)!.changeTitle,
            // 'Enter New Password',
            style: TextStyle(
                color: const Color(0xff23203F),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,),
          ),
          Text(
            AppLocalizations.of(context)!.changeSubTitle,
            // 'Are you sure you want to change the password?',
            style: TextStyle(
                color: const Color(0xff716F87),
                fontFamily: 'Nunito',
                fontSize: 18.sp
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            hintText: AppLocalizations.of(context)!.currentPassword,
            // hintText: 'Current Password',
            textEditingController: _currentPasswordTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            hintText: AppLocalizations.of(context)!.newPassword,
            // hintText: 'New Password',
            textEditingController: _newPasswordTextEditingController,
            textInputType: TextInputType.text,
            obscureText: _isPasswordShow1,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordShow1 = !_isPasswordShow1;
                });
              },
              icon: Icon(
                _isPasswordShow1
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: _isPasswordShow1 ? const Color(0xff9391A4) : const Color(0xff6A90F2),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            hintText: AppLocalizations.of(context)!.confirmPassword,
            // hintText: 'Password Confirmation',
            textEditingController: _newPasswordConfirmationTextEditingController,
            textInputType: TextInputType.text,
            obscureText: _isPasswordShow2,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordShow2 = !_isPasswordShow2;
                });
              },
              icon: Icon(
                _isPasswordShow2
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: _isPasswordShow2 ? const Color(0xff9391A4) : const Color(0xff6A90F2),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () async => await performChangePassword(),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(0.w, 56.h),
            ),
            child: Text(
              AppLocalizations.of(context)!.changePassword,
              // 'Change Password',
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

  Future<void> performChangePassword() async {
    if (checkData()) {
      await changePassword();
    }
  }

  bool checkData() {
    if (checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_currentPasswordTextEditingController.text.isNotEmpty &&
        _newPasswordTextEditingController.text.isNotEmpty &&
        _newPasswordConfirmationTextEditingController.text.isNotEmpty) {
      if (_newPasswordTextEditingController.text ==
          _newPasswordConfirmationTextEditingController.text) {
        return true;
      }
      showSnackBar(
        context: context,
        message: AppLocalizations.of(context)!.passwordConfirmation,
        error: true,
      );
      return false;
    }
    showSnackBar(
      context: context,
      message: AppLocalizations.of(context)!.enterRequired,
      error: true,
    );
    return false;
  }

  Future<void> changePassword() async {
    bool status = await AuthApiController().changePassword(
        context,
        currentPassword: _currentPasswordTextEditingController.text,
        password: _newPasswordTextEditingController.text
    );
    if (status) Navigator.pop(context);
  }

}

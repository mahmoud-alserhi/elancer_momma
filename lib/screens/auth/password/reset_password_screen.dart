import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:elancer_momma/widgets/code_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    Key? key,
    required this.mobile,
  }) : super(key: key);

  final String mobile;

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Helpers {

  late TextEditingController _newPasswordTextEditingController;
  late TextEditingController _newPasswordConfirmationTextEditingController;

  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  String? _code;


  // late bool _isSelectedCode1 = true;
  // late bool _isSelectedCode2 = true;
  // late bool _isSelectedCode3 = true;
  // late bool _isSelectedCode4 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _newPasswordTextEditingController = TextEditingController();
    _newPasswordConfirmationTextEditingController = TextEditingController();

    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordTextEditingController.dispose();
    _newPasswordConfirmationTextEditingController.dispose();

    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();

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
          // AppLocalizations.of(context)!.resetPassword,
            'Reset Password',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25.sp,
              color: const Color(0xff23203F),
              fontWeight: FontWeight.bold,
            )),
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
            'Enter New Password',
            style: TextStyle(
                color: const Color(0xff23203F),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,),
          ),
          Text(
            'Enter New Password and received code',
            style: TextStyle(
                color: const Color(0xff716F87),
                fontFamily: 'Nunito',
                fontSize: 18.sp
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: CodeTextField(
                  // color: _isSelectedCode1,
                  textEditingController: _firstCodeTextController,
                  focusNode: _firstFocusNode,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _secondFocusNode.requestFocus();

                    }
                  },
                    // onTap: (){
                    // setState(() {
                    //   _isSelectedCode1 = false;
                    //   _isSelectedCode2 = true;
                    //   _isSelectedCode3 = true;
                    //   _isSelectedCode4 = true;
                    //
                    // });
                    // },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: CodeTextField(
                  // color: _isSelectedCode2,
                  textEditingController: _secondCodeTextController,
                  focusNode: _secondFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _thirdFocusNode.requestFocus()
                        : _firstFocusNode.requestFocus();
                  },
                  // onTap: (){
                  //   setState(() {
                  //     _isSelectedCode1 = true;
                  //     _isSelectedCode2 = false;
                  //     _isSelectedCode3 = true;
                  //     _isSelectedCode4 = true;
                  //   });
                  // },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: CodeTextField(
                  // color: _isSelectedCode3,
                  textEditingController: _thirdCodeTextController,
                  focusNode: _thirdFocusNode,
                  onChanged: (value) {
                    value.isNotEmpty
                        ? _fourthFocusNode.requestFocus()
                        : _secondFocusNode.requestFocus();
                  },
                  // onTap: (){
                  //   setState(() {
                  //     _isSelectedCode1 = true;
                  //     _isSelectedCode2 = true;
                  //     _isSelectedCode3 = false;
                  //     _isSelectedCode4 = true;
                  //   });
                  // },
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: CodeTextField(
                  // color: _isSelectedCode4,
                  textEditingController: _fourthCodeTextController,
                  focusNode: _fourthFocusNode,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _thirdFocusNode.requestFocus();
                    }
                  },
                  // onTap: (){
                  //   setState(() {
                  //     _isSelectedCode1 = true;
                  //     _isSelectedCode2 = true;
                  //     _isSelectedCode3 = true;
                  //     _isSelectedCode4 = false;
                  //   });
                  // },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            hintText: 'Password',
            textEditingController: _newPasswordTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            hintText: 'Password Confirmation',
            textEditingController: _newPasswordConfirmationTextEditingController,
            textInputType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () async => await performResetPassword(),
            // onPressed: () async => await performResetPassword(),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(0.w, 56.h),
            ),
            child: Text(
              'Reset',
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

  Future<void> performResetPassword() async {
    if (checkData()) {
      await resetPassword();
    }
  }

  bool checkData() {
    if (checkCode() && checkPassword()) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (_newPasswordTextEditingController.text.isNotEmpty &&
        _newPasswordConfirmationTextEditingController.text.isNotEmpty) {
      if (_newPasswordTextEditingController.text ==
          _newPasswordConfirmationTextEditingController.text) {
        return true;
      }
      showSnackBar(
        context: context,
        message: 'Password confirmation error!',
        error: true,
      );
      return false;
    }
    showSnackBar(
      context: context,
      message: 'Enter New Password!',
      error: true,
    );
    return false;
  }

  bool checkCode() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      getVerificationCode();
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter Verification Code!',
      error: true,
    );
    return false;
  }

  String getVerificationCode() {
    return _code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
  }

  Future<void> resetPassword() async {
    bool status = await AuthApiController().resetPassword(
        context,
        mobile: widget.mobile,
        code: _code!,
        password: _newPasswordTextEditingController.text,
    );
    if (status) Navigator.pop(context);
  }

}

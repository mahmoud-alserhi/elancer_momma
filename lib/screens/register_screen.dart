import 'package:elancer_momma/models/cities.dart';
import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _mobileTextEditingController;
  late TextEditingController _passwordTextEditingController;

  late bool _isPasswordShow;
  String _gender = 'M';
  int? _selectedAddress;
  final List<Cities> _addresses = <Cities>[
    const Cities(id: 1, name: 'Gaza'),
    const Cities(id: 2, name: 'Rafah'),
    const Cities(id: 3, name: 'Khanyounis'),
    const Cities(id: 4, name: 'Al-Borayj'),
    const Cities(id: 5, name: 'Al-Nasser'),
  ];

  late TapGestureRecognizer _tapGestureRecognizer;

  void navigateToRegisterScreen() {
    Navigator.pushReplacementNamed(context, '/login_screen');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _mobileTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();

    _isPasswordShow = true;

    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = navigateToRegisterScreen;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
    _mobileTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _tapGestureRecognizer.dispose();
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
            // AppLocalizations.of(context)!.register,
            'Register',
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        children: [
          Text(
            // AppLocalizations.of(context)!.singUp,
            'Sing Up',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 30.sp,
                color: const Color(0xff23203F),
                fontWeight: FontWeight.bold),
          ),
          Text(
            // AppLocalizations.of(context)!.singIn,
            'Create Account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18.sp,
              color: const Color(0xff716F87),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 28.h,
          ),
          AppTextFiled(
            textEditingController: _nameTextEditingController,
            hintText: 'Name',
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            textEditingController: _mobileTextEditingController,
            hintText: 'Mobile',
            textInputType: TextInputType.phone,
          ),
          SizedBox(
            height: 20.h,
          ),
          AppTextFiled(
            textEditingController: _passwordTextEditingController,
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
                _isPasswordShow ? Icons.visibility_off : Icons.visibility,
                color: _isPasswordShow
                    ? const Color(0xff9391A4)
                    : const Color(0xff6A90F2),
                // color: const Color(0xff6A90F2),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: DropdownButton(
              borderRadius: BorderRadius.circular(15),
              elevation: 8,
              underline: const SizedBox.shrink(),
              isExpanded: true,
              hint: Text(
                'Select City',
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 18.sp,
                  color: const Color(0xff9391A4),
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
              onChanged: (int? value) {
                if (value != null) {
                  setState(() {
                    _selectedAddress = value;
                  });
                }
              },
              value: _selectedAddress,
              items: _addresses.map((e) {
                return DropdownMenuItem(
                  child: Text(e.name),
                  value: e.id,
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            // AppLocalizations.of(context)!.gender,
            'Gender',
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 20.sp,
                color: const Color(0xff23203F),
                fontWeight: FontWeight.w600),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: RadioListTile<String>(
                    title: Text('Male',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            color: const Color(0xff23203F),
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.zero,
                    value: 'M',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _gender = value;
                        });
                      }
                    }),
              ),
              Expanded(
                child: RadioListTile<String>(
                    title: Text('Female',
                        style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 20.sp,
                            color: const Color(0xff23203F),
                            fontWeight: FontWeight.w600)),
                    contentPadding: EdgeInsets.zero,
                    value: 'F',
                    groupValue: _gender,
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _gender = value;
                        });
                      }
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/activate_screen');
            },
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(double.infinity, 56.h),
            ),
            child: Text(
              'Sing Up',
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
                text: 'Already have an account? ',
                style: TextStyle(
                  color: const Color(0xff23203F),
                  fontFamily: 'Nunito',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    recognizer: _tapGestureRecognizer,
                    text: 'Sing In!',
                    style: TextStyle(
                      color: Color(0xff6A90F2),
                      fontFamily: 'Nunito',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

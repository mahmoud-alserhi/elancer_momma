import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:elancer_momma/api/controllers/city_api_controller.dart';
import 'package:elancer_momma/get/language_getx_controller.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/city.dart';
import 'package:elancer_momma/widgets/app_text_filed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    Key? key,
  }) : super(key: key);


  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen>
    with Helpers {

  late TextEditingController _nameTextEditingController;
  int? _selectedCity;
  String _gender = 'M';

  List<City> _city = <City>[];
  late Future<List<City>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController();
    _future = CityApiController().getCity();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();

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
            'Update Profile',
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25.sp,
              color: const Color(0xff23203F),
              fontWeight: FontWeight.bold,
            )),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                LanguageGetxController.to.changeLanguage();
              });
            },
            icon: const Icon(
              Icons.language,
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
            'Enter New Information',
            style: TextStyle(
                color: const Color(0xff23203F),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,),
          ),
          Text(
            'Are you sure you want to change the Information?',
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
            hintText: 'Name',
            textEditingController: _nameTextEditingController,
            textInputType: TextInputType.text,
          ),
          SizedBox(
            height: 20.h,
          ),
          InputDecorator(
            decoration: InputDecoration(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              contentPadding: const EdgeInsets.all(10),
            ),
            child: FutureBuilder<List<City>>(
              future: _future,
              builder: (context, snapshot) {
                if(snapshot.hasData && snapshot.data!.isNotEmpty){
                  _city = snapshot.data ?? [];
                  return DropdownButton(
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
                          _selectedCity = value;
                        });
                      }
                    },
                    value: _selectedCity,
                    items: _city.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.nameEn),
                        value: e.id,
                      );
                    }).toList(),
                  );
                }else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
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
            height: 40.h,
          ),
          ElevatedButton(
            onPressed: () async => await performUpdateInformation(),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff6A90F2),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              minimumSize: Size(0.w, 56.h),
            ),
            child: Text(
              'Update Information',
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

  Future<void> performUpdateInformation() async {
    if (checkData()) {
      await updateInformation();
    }
  }

  bool checkData() {
    if (_nameTextEditingController.text.isNotEmpty &&
        _selectedCity != null) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }


  Future<void> updateInformation() async {
    bool status = await AuthApiController().updateProfile(
        context,
        name: _nameTextEditingController.text,
        city_id: _selectedCity!,
        gender: _gender
    );
    if (status) Navigator.pop(context);
  }

  // User get user {
  //   User user = User();
  //   user.name = _nameTextEditingController.text;
  //   user.mobile = _mobileTextEditingController.text;
  //   user.password = _passwordTextEditingController.text;
  //   user.gender = _gender;
  //   user.cityId = _selectedAddress!;
  //   return user;
  // }

}

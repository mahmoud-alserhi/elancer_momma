import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helpers{

  void showSnackBar({
    required BuildContext context,
    required String message,
    bool error = false
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor: error ? const Color(0xffEF4444) : const Color(0xff34D399),
          behavior: SnackBarBehavior.floating,duration: const Duration(seconds: 2),
          margin: const EdgeInsetsDirectional.only(bottom: 20,start: 20,end: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          //This is New Property to dismiss snackBar
          dismissDirection: DismissDirection.horizontal,
        )
    );
  }

  Future<void> logOut(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if(loggedOut){
      Future.delayed(const Duration(seconds: 1),(){
        Navigator.pushReplacementNamed(
          context, '/login_screen',);
      });
    }
  }

  Map<String,String> get headers {
    var headers ={
      'Accept':'application/json',
      'lang':SharedPrefController().checkLanguage
    };
    if(SharedPrefController().loggedIn) {
      headers['Authorization'] = SharedPrefController().token;
      // headers['Authorization'] = 'Bearer TOKEN';
    }
    else if(SharedPrefController().register) {
      headers['Authorization'] = SharedPrefController().token;
      // headers['Authorization'] = 'Bearer TOKEN';
    }
    return headers;
  }

  void showSnackBarCode({
    required BuildContext context,
    required String message,
    bool error = false
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message),
          backgroundColor: error ? const Color(0xffEF4444) : const Color(0xff6A90F2),
          behavior: SnackBarBehavior.floating,duration: const Duration(seconds: 12),
          margin: const EdgeInsetsDirectional.only(bottom: 20,start: 20,end: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          //This is New Property to dismiss snackBar
          dismissDirection: DismissDirection.horizontal,
        )
    );
  }

}
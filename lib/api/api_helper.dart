import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Helpers{

  // void showSnackBar({
  //   required BuildContext context,
  //   required String message,
  //   bool error = false
  // }) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(message),
  //         backgroundColor: error ? const Color(0xffEF4444) : const Color(0xff34D399),
  //         behavior: SnackBarBehavior.floating,duration: const Duration(seconds: 2),
  //         margin: const EdgeInsetsDirectional.only(bottom: 20,start: 20,end: 20),
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10)
  //         ),
  //         //This is New Property to dismiss snackBar
  //         dismissDirection: DismissDirection.horizontal,
  //       )
  //   );
  // }

  Map<String,String> get headers {
    var headers ={
      'Accept':'application/json',
      'lang':SharedPrefController().checkLanguage
    };
    if(SharedPrefController().loggedIn) {
      headers['Authorization'] = 'Bearer TOKEN';
    }
    return headers;
  }

}
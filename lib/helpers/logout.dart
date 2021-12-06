import 'package:elancer_momma/api/controllers/auth_api_controller.dart';
import 'package:flutter/material.dart';

mixin Logout{
  Future<void> logOut(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if(loggedOut){
      Future.delayed(const Duration(seconds: 1),(){
        Navigator.pushReplacementNamed(
          context, '/login_screen',);
      });
    }
  }
}
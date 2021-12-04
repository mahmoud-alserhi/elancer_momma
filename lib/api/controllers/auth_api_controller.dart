import 'dart:convert';
import 'dart:io';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/models/user.dart';

class AuthApiController with Helpers{

  Future<bool> register(BuildContext context, {required User user}) async{
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, body: {
      'name':user.name,
      'mobile':user.mobile,
      'password':user.password,
      'gender':user.gender,
      'STORE_API_KEY':ApiSettings.storeApiKey,
      // 'city_id':'1',
      'city_id':user.cityId,
    });

    if (response.statusCode == 201) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      print(jsonDecode(response.body)['code']);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }
  
  Future<bool> activatePhone(BuildContext context, {required String mobile, required String code}) async{
    var url = Uri.parse(ApiSettings.activatePhone);
    var response = await http.post(url,body: {
      'mobile': mobile,
      'code': code,
    },
      headers: {
      'lang':'en'
      },);
    if(response.statusCode == 200){
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    }else if(response.statusCode == 400){
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }else if(response.statusCode == 500){
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again!',
          error: true);
    }
    return false;
  }
  
  Future<bool> login(BuildContext context, {required String mobile, required String password}) async{
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url,body: {
      'mobile': mobile,
      'password': password,
    },
      headers: {
      'lang':'ar'
    },);
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body)['data'];
      User user = User.fromJson(jsonObject);
      SharedPrefController().save(user: user);

      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }

  Future<bool> logout() async{
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url,headers: {
      'lang':'en',
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json',
    });
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }

  Future<bool> forgetPassword(BuildContext context,
      {required String mobile}) async {
    var url = Uri.parse(ApiSettings.forgetPassword);
    var response = await http.post(url, body: {
      'mobile': mobile,
    },headers: {
      'lang':'en',
    },);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body)['code']);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    } else {
      print(response.statusCode);
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again!',
          error: true);
    }
    return false;
  }

  Future<bool> resetPassword(BuildContext context,
      {required String mobile,
        required String code,
        required String password}) async {
    var url = Uri.parse(ApiSettings.resetPassword);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'code': code,
      'password': password,
      'password_confirmation': password,
    }, headers: {
      'lang':'ar',
      HttpHeaders.acceptHeader: 'application/json',
    });

    if(response.statusCode == 200){
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
      );
      return true;
    }else if(response.statusCode == 400){
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }else if(response.statusCode == 500){
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again!',
          error: true);
    }
    return false;
  }

}
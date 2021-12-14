import 'dart:convert';
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Contact with Helpers {

  Future<bool> sendMessage(BuildContext context,
      {required String subject, required String message}) async {
    var url = Uri.parse(ApiSettings.contactRequests);
    var response = await http.post(url,
        body: {
          'subject': subject,
          'message': message,
        },
        headers: headers);
    if (response.statusCode == 201) {
      // print(response.statusCode);
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
    } else if (response.statusCode == 500) {
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again!',
          error: true);
    }
    return false;
  }
}

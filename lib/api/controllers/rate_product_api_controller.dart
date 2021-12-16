import 'dart:convert';
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RateProductApiController with Helpers {
  Future<bool> rateProduct(BuildContext context,
      {required int productId, required double rate}) async {
    var url = Uri.parse(ApiSettings.rateProduct);
    var response = await http.post(url,
        body: {
          'product_id': productId.toString(),
          'rate': rate.toString(),
        },
        headers: headers
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }else {
      print(response.statusCode);
      showSnackBar(
          context: context,
          message: 'Something went wrong, please try again!',
          error: true);
    }
    return false;
  }
}

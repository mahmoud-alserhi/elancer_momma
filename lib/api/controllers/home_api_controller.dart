import 'dart:convert';
import 'dart:io';
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/models/api/base_api_object_response.dart';
import 'package:elancer_momma/models/api/home_response.dart';
import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class HomeApiController {

  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token
    });
    if (response.statusCode == 200) {
      var baseResponse = BaseApiObjectResponse<HomeResponse>.fromJson(jsonDecode(response.body));
      return baseResponse.data;
    }
    return null;
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/city.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class CityApiController with Helpers{

  Future<List<City>> getCity() async {
    var url = Uri.parse(ApiSettings.city);
    var response = await http.get(url,
        headers: headers
    //     {
    //   HttpHeaders.acceptHeader: 'application/json',
    // }
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var cityJsonArray = jsonDecode(response.body)['list']as List;
      return cityJsonArray
          .map((jsonObject) => City.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

}
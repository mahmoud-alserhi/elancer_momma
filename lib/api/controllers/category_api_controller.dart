import 'dart:convert';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/category.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class CategoryApiController with Helpers{

  Future<List<Category>> showCategory() async {
    var url = Uri.parse(ApiSettings.category);
    var response = await http.get(url,
        headers: headers
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      var categoryJsonArray = jsonDecode(response.body)['list'] as List;
      // var categoryJsonArray = jsonDecode(response.body)['list'] as List;
      return categoryJsonArray
          .map((jsonObject) => Category.fromJson(jsonObject))
          .toList();
    }
    print(jsonDecode(response.body));
    return [];
  }

}
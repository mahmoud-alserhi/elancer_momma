import 'dart:convert';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/sub_category/sub_category.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class SubCategoryApiController with Helpers{

  Future<List<SubCategory>> showSubCategory(int? idCategory) async {
    var url = Uri.parse(ApiSettings.subCategory + idCategory.toString());
    var response = await http.get(url,
        headers: headers
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(jsonDecode(response.body));
      var subCategoryJsonArray = jsonDecode(response.body)['list'] as List;
      return subCategoryJsonArray
          .map((jsonObject) => SubCategory.fromJson(jsonObject))
          .toList();
    }
    // print(jsonDecode(response.body));
    return [];
  }

}
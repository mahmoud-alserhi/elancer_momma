import 'dart:convert';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/products/product_read.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class ProductReadApiController with Helpers{

  Future<List<ProductRead>> showProductRead(int? idSubCategory) async {
    var url = Uri.parse(ApiSettings.productRead + idSubCategory.toString());
    var response = await http.get(url,
        headers: headers
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(jsonDecode(response.body));
      var productReadJsonArray = jsonDecode(response.body)['list'] as List;
      return productReadJsonArray
          .map((jsonObject) => ProductRead.fromJson(jsonObject))
          .toList();
    }
    // print(jsonDecode(response.body));
    return [];
  }

}
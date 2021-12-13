import 'dart:convert';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_momma/api/api_settings.dart';

class ProductReadApiController with Helpers{

  Future<List<Product>> showProductRead(int? idSubCategory) async {
    var url = Uri.parse(ApiSettings.productRead + idSubCategory.toString());
    print(url);
    var response = await http.get(url,
        headers: headers
    );
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print("RESPONSE: ${response.statusCode}");
      var productReadJsonArray = jsonDecode(response.body)['list'] as List;
      var list = productReadJsonArray
          .map((jsonObject) => Product.fromJson(jsonObject))
          .toList();

      print(list.length);
      return list;
    }
    // print(jsonDecode(response.body));
    return [];
  }

}
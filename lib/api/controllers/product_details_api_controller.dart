import 'dart:convert';
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/base_api_object_response.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:http/http.dart' as http;

class ProductDetailsApiController with Helpers{

  Future<Product?> showProductDetails(int? idProduct) async {
    var url = Uri.parse(ApiSettings.productDetail + idProduct.toString());
    var response = await http.get(url,
        headers: headers
    );
    if (response.statusCode == 200) {
      var baseResponse = BaseApiObjectResponse<Product>.fromJson(jsonDecode(response.body));
      return baseResponse.object;
    }
    return null;
  }
}

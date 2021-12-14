import 'dart:convert';
import 'package:elancer_momma/api/api_settings.dart';
import 'package:elancer_momma/helpers/helpers.dart';
import 'package:elancer_momma/models/api/favorite_product/favorite_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class FavoriteProductApiController with Helpers {

  Future<bool> postFavorite(BuildContext context,{required int productId}) async{
    var url = Uri.parse(ApiSettings.postFavorite);
    var response = await http.post(url,
        body: {
      'product_id': productId.toString(),
        },
        headers: headers);
    print(response.statusCode);
    if(response.statusCode == 200){
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message']);
      return true;
    }else if(response.statusCode == 400){
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
          error: true);
    }
    return false;
  }

  Future<List<FavoriteProducts>> getFavorite() async{
    var url = Uri.parse(ApiSettings.getFavorite);
    var response = await http.get(url,headers: headers);

    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var favoriteJsonArray = jsonDecode(response.body)['list']as List;
      return favoriteJsonArray
          .map((jsonObject) => FavoriteProducts.fromJson(jsonObject))
          .toList();
    }
    return [];
  }

}
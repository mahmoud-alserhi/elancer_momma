import 'package:elancer_momma/models/api/home/category.dart';
import 'package:elancer_momma/models/api/home/product.dart';
import 'package:elancer_momma/models/api/home/slider.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:elancer_momma/models/api/products/product.dart';

class HomeResponse {
  late List<SliderHome> slider;
  late List<CategoryHome> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;

  HomeResponse.fromJson(Map<String, dynamic> json) {

    if (json['slider'] != null) {
      slider = <SliderHome>[];
      json['slider'].forEach((jsonObject) {
        slider.add(SliderHome.fromJson(jsonObject));
      });
    }

    if (json['categories'] != null) {
      categories = <CategoryHome>[];
      json['categories'].forEach((jsonObject) {
        categories.add(CategoryHome.fromJson(jsonObject));
      });
      // print(categories.length.toString()+"aaaaa");
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((jsonObject) {
        latestProducts.add(Product.fromJson(jsonObject));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((jsonObject) {
        famousProducts.add(Product.fromJson(jsonObject));
      });
    }
  }
}

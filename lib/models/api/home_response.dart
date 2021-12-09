import 'package:elancer_momma/models/api/category.dart';
import 'package:elancer_momma/models/api/product.dart';
import 'package:elancer_momma/models/api/slider.dart';

class HomeResponse {
  late List<Slider> slider;
  late List<Category> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;

  HomeResponse.fromJson(Map<String, dynamic> json) {

    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((jsonObject) {
        slider.add(Slider.fromJson(jsonObject));
      });
    }

    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((jsonObject) {
        categories.add(Category.fromJson(jsonObject));
      });
      print(categories.length.toString()+"aaaaa");
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

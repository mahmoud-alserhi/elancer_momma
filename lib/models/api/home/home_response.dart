import 'package:elancer_momma/models/api/home/category.dart';
import 'package:elancer_momma/models/api/home/product.dart';
import 'package:elancer_momma/models/api/home/slider.dart';

class HomeResponse {
  late List<SliderHome> slider;
  late List<CategoryHome> categories;
  late List<ProductHome> latestProducts;
  late List<ProductHome> famousProducts;

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
      latestProducts = <ProductHome>[];
      json['latest_products'].forEach((jsonObject) {
        latestProducts.add(ProductHome.fromJson(jsonObject));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <ProductHome>[];
      json['famous_products'].forEach((jsonObject) {
        famousProducts.add(ProductHome.fromJson(jsonObject));
      });
    }
  }
}

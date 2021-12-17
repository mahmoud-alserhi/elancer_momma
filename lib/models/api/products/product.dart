import 'package:elancer_momma/models/api/sub_category/sub_category.dart';
import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'image.dart';

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num price;
  late int quantity;
  late num overalRate;
  late int subCategoryId;
  late num productRate;
  late num? offerPrice;
  late bool isFavorite;
  late String imageUrl;
  late List<Images> images;
  late SubCategory subCategory;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];

    if (json.containsKey('images') && json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images.add(Images.fromJson(v));
      });
    }
    if (json.containsKey('sub_category') && json['sub_category'] != null) {
      subCategory = SubCategory.fromJson(json['sub_category']);
    }

  }

  String get productName =>
      SharedPrefController().checkLanguage == 'en' ? nameEn : nameAr;

  String get infoProduct =>
      SharedPrefController().checkLanguage == 'en' ? infoEn : infoAr;
}

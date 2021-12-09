import 'package:elancer_momma/prefs/shared_pref_controller.dart';

class Product {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late int price;
  late int quantity;
  late double overalRate;
  late int subCategoryId;
  late int productRate;
  late num offerPrice;
  late bool isFavorite;
  late String imageUrl;


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
  }

  String get productName =>
      SharedPrefController().checkLanguage == 'en' ? nameEn : nameAr;

  String get infoName =>
      SharedPrefController().checkLanguage == 'en' ? infoEn : infoAr;

}
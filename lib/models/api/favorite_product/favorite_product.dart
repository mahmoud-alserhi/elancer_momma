import 'package:elancer_momma/models/api/favorite_product/pivot.dart';
import 'package:elancer_momma/prefs/shared_pref_controller.dart';

class FavoriteProducts {
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
  late Pivot pivot;


  FavoriteProducts.fromJson(Map<String, dynamic> json) {
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
    pivot = (json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null)!;
  }

  String get favoriteProductName =>
      SharedPrefController().checkLanguage == 'en' ? nameEn : nameAr;

  String get favoriteInfoProduct =>
      SharedPrefController().checkLanguage == 'en' ? infoEn : infoAr;

}
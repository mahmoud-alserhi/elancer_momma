import 'package:elancer_momma/prefs/shared_pref_controller.dart';

class Category {
  late int id;
  late String nameEn;
  late String nameAr;
  late String image;
  late String imageUrl;
  late int? productsCount;
  late int? subCategoriesCount;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    imageUrl = json['image_url'];
    productsCount = json['products_count'];
    subCategoriesCount = json['sub_categories_count'];
  }

  String get categoryName =>
      SharedPrefController().checkLanguage == 'en' ? nameEn : nameAr;
}

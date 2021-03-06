import 'package:elancer_momma/prefs/shared_pref_controller.dart';

class CategoryHome {
  late int id;
  late String nameEn;
  late String nameAr;
  late String image;
  late String imageUrl;


  CategoryHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    imageUrl = json['image_url'];

  }

  String get categoryName =>
      SharedPrefController().checkLanguage == 'en' ? nameEn : nameAr;
}

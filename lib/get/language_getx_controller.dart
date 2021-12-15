import 'package:elancer_momma/prefs/shared_pref_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LanguageGetxController extends GetxController {

  String language = '';

  static LanguageGetxController get to => Get.find<LanguageGetxController>();

  @override
  void onInit() {
    // TODO: implement onInit
    language = SharedPrefController().checkLanguage;
    super.onInit();
  }

  void changeLanguage() {
    language = language == 'en' ? 'ar' : 'en';
    SharedPrefController().setLanguage(lang: language);
    update();
  }
}

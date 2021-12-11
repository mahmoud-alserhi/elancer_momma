import 'package:elancer_momma/api/controllers/category_api_controller.dart';
import 'package:elancer_momma/models/api/category.dart';
import 'package:elancer_momma/models/api/home_response.dart';
import 'package:get/get.dart';

class CategoryGetxController extends GetxController {
  // late HomeResponse homeResponse;
  HomeResponse? homeResponse;
  // Category? category;
  bool loading = false;
  final CategoryApiController _categoryApiController = CategoryApiController();

  static CategoryGetxController get to => Get.find<CategoryGetxController>();

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  Future<void> getCategory() async {
    loading = true;
    // homeResponse = await _categoryApiController.showCategory() as HomeResponse?;
    homeResponse = await _categoryApiController.showCategory() as HomeResponse;
    // category = (await _categoryApiController.showCategory()) as Category?;
    loading = false;
    update();
  }
}

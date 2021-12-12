import 'package:elancer_momma/api/controllers/home_api_controller.dart';
import 'package:elancer_momma/models/api/home/home_response.dart';
import 'package:get/get.dart';

class ProductDetailGetxController extends GetxController {

  HomeResponse? homeResponse;
  bool loading = false;
  final HomeApiController _homeApiController = HomeApiController();

  static ProductDetailGetxController get to => Get.find<ProductDetailGetxController>();

  @override
  void onInit() {
    getProductDetail();
    super.onInit();
  }

  Future<void> getProductDetail() async {
    loading = true;
    homeResponse = await _homeApiController.showHome();
    loading = false;
    update();
  }
}

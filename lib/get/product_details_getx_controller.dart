import 'package:elancer_momma/api/controllers/home_api_controller.dart';
import 'package:elancer_momma/api/controllers/product_details_api_controller.dart';
import 'package:elancer_momma/models/api/products/product.dart';
import 'package:get/get.dart';

class ProductDetailsGetxController extends GetxController {

  Product? product;
  bool loading = false;
  final ProductDetailsApiController _productDetailsApiController = ProductDetailsApiController();

  static ProductDetailsGetxController get to => Get.find<ProductDetailsGetxController>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getProductDetails(int id) async {
    loading = true;
    product = await _productDetailsApiController.showProductDetails(id);
    // productDetails = await _productDetailsApiController.showProductDetails(productDetails!.subCategory.id);
    loading = false;
    update();
  }
}

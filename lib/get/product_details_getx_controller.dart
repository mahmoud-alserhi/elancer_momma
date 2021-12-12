import 'package:elancer_momma/api/controllers/home_api_controller.dart';
import 'package:elancer_momma/api/controllers/product_details_api_controller.dart';
import 'package:elancer_momma/models/api/products/product_detail.dart';
import 'package:elancer_momma/models/api/products/product_read.dart';
import 'package:get/get.dart';

class ProductDetailsGetxController extends GetxController {

  ProductDetails? productDetails;
  ProductRead? productRead;
  bool loading = false;
  final ProductDetailsApiController _productDetailsApiController = ProductDetailsApiController();

  static ProductDetailsGetxController get to => Get.find<ProductDetailsGetxController>();

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }

  Future<void> getProductDetails() async {
    loading = true;
    productDetails = await _productDetailsApiController.showProductDetails(productRead!.id);
    // productDetails = await _productDetailsApiController.showProductDetails(productDetails!.subCategory.id);
    loading = false;
    update();
  }
}

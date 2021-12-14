import 'package:elancer_momma/api/controllers/favorite_product_api_controller.dart';
import 'package:elancer_momma/api/controllers/product_details_api_controller.dart';
import 'package:elancer_momma/models/api/favorite_product/favorite_product.dart';
import 'package:get/get.dart';

class FavoriteProductGetxController extends GetxController {

  // FavoriteProducts? favoriteProducts;
  late List<FavoriteProducts> favoriteProducts;
  bool loading = false;
  final FavoriteProductApiController _favoriteProductApiController = FavoriteProductApiController();

  static FavoriteProductGetxController get to => Get.find<FavoriteProductGetxController>();

  @override
  void onInit() {
    getFavoriteProduct();
    super.onInit();
  }

  Future<void> getFavoriteProduct() async {
    loading = true;
    favoriteProducts = await _favoriteProductApiController.getFavorite();
    loading = false;
    update();
  }
}

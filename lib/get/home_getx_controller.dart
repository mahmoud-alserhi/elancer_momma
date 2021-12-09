import 'package:elancer_momma/api/controllers/home_api_controller.dart';
import 'package:elancer_momma/models/api/home_response.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController {
  // late HomeResponse homeResponse;
  HomeResponse? homeResponse;
  bool loading = false;
  final HomeApiController _homeApiController = HomeApiController();

  static HomeGetxController get to => Get.find<HomeGetxController>();

  @override
  void onInit() {
    getHome();
    super.onInit();
  }

  Future<void> getHome() async {
    loading = true;
    homeResponse = await _homeApiController.showHome();
    loading = false;
    update();
  }
}

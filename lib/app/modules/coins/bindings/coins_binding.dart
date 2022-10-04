import 'package:get/get.dart';

import '../controllers/coins_controller.dart';

class CoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinsController>(
      () => CoinsController(),
    );
  }
}

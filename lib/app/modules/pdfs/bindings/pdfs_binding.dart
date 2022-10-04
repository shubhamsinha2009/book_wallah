import 'package:get/get.dart';

import '../controllers/pdfs_controller.dart';

class PdfsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfsController>(
      () => PdfsController(),
    );
  }
}

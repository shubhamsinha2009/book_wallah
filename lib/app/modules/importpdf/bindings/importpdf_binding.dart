import 'package:get/get.dart';

import '../controllers/importpdf_controller.dart';

class ImportpdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportpdfController>(
      () => ImportpdfController(),
    );
  }
}

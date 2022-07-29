import 'package:get/get.dart';

import '../controllers/view_pdf_controller.dart';

class ViewPdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewPdfController>(
      () => ViewPdfController(),
    );
  }
}

import 'package:get/get.dart';

import '../controllers/book_page_controller.dart';

class BookPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookPageController>(
      () => BookPageController(),
    );
  }
}

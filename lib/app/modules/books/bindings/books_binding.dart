import 'package:get/get.dart';

import '../controllers/books_controller.dart';

class BooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksController>(
      () => BooksController(),
    );
  }
}

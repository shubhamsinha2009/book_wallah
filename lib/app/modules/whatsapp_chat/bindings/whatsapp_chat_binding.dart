import 'package:get/get.dart';

import '../controllers/whatsapp_chat_controller.dart';

class WhatsappChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WhatsappChatController>(
      () => WhatsappChatController(),
    );
  }
}

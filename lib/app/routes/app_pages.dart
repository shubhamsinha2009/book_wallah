import 'package:get/get.dart';

import '../modules/book_page/bindings/book_page_binding.dart';
import '../modules/book_page/views/book_page_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/download/bindings/download_binding.dart';
import '../modules/download/views/download_view.dart';
import '../modules/downloaded/bindings/downloaded_binding.dart';
import '../modules/downloaded/views/downloaded_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';

import '../modules/view_pdf/bindings/view_pdf_binding.dart';
import '../modules/view_pdf/views/view_pdf_view.dart';
import '../modules/whatsapp_chat/bindings/whatsapp_chat_binding.dart';
import '../modules/whatsapp_chat/views/whatsapp_chat_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const intial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      transition: Transition.rightToLeft,
      bindings: [
        HomeBinding(),
        SettingsBinding(),
        DashboardBinding(),
      ],
    ),
    GetPage(
      name: _Paths.viewPdf,
      page: () => const ViewPdfView(),
      binding: ViewPdfBinding(),
    ),
    GetPage(
      name: _Paths.whatsappChat,
      page: () => const WhatsappChatView(),
      binding: WhatsappChatBinding(),
      transition: Transition.rightToLeft,
    ),
    
    GetPage(
      name: _Paths.bookPage,
      page: () => const BookPageView(),
      binding: BookPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.download,
      page: () => const DownloadView(),
      binding: DownloadBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.downloaded,
      page: () => const DownloadedView(),
      binding: DownloadedBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}

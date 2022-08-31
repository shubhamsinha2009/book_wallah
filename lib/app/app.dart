import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/themes/theme.dart';
import 'routes/app_pages.dart';

class BooksWallah extends StatelessWidget {
  const BooksWallah({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Hive.box('settings').get('darkmode', defaultValue: true);
    return GetMaterialApp(
      title: "Books Wallah",
      initialRoute: AppPages.intial,
      getPages: AppPages.routes,
      theme: Themes.appLightTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: Themes.appDarkTheme,
      enableLog: true,
    );
  }
}

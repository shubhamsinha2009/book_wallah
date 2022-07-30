import 'package:books_wallah/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/core/services/init_services.dart';

Future<void> main() async {
  await initServices();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const BooksWallah()));
}

import 'package:books_wallah/app/app.dart';
import 'package:flutter/material.dart';

import 'app/core/services/init_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const BooksWallah());
}

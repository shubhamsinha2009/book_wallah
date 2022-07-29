import 'package:get_storage/get_storage.dart';

class GetStorageDbService {
  static final box = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static getRead({required String key}) {
    return box.read(key);
  }

  static getWrite({required String key, required value}) {
    box.write(key, value);
  }

  static getRemove({required String key}) {
    box.remove(key);
  }
}

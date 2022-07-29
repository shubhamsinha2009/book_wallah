import 'getstorage.dart';

Future<void> initServices() async {
  await GetStorageDbService.init();
}

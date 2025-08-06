
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'domain/local/preferences/local_storage.dart';
import 'domain/local/preferences/storage_controller.dart';
import 'features/home/controller/home_controller.dart';

final locator = GetIt.instance;

Future<void> init(LocalStorage localStorage) async {
  final prefs = localStorage.sharedPreference;

  // ==# Register dependencies with GetIt for core services
  locator.registerLazySingleton<LocalStorage>(() => localStorage);
  locator.registerLazySingleton<StorageController>(() => StorageController(prefs: prefs));

  // ==# UI Controllers using GetX lazyPut for screen management
  Get.lazyPut(() => HomePageController(), fenix: true);

  // ==# Register GetIt services within GetX for further access
  Get.lazyPut(() => locator<StorageController>(), fenix: true);

}

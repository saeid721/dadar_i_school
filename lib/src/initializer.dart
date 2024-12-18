
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'domain/local/preferences/local_storage.dart';
import 'domain/local/preferences/storage_controller.dart';
import 'domain/server/http_client/request_handler.dart';
import 'features/dashboard_bottom_navigation_bar/controller/dashboard_buttom_controller.dart';
import 'features/home/controller/home_controller.dart';
import 'features/my_account/controller/my_account_controller.dart';
import 'features/video_details/controller/video_details_controller.dart';

final locator = GetIt.instance;

Future<void> init(LocalStorage localStorage) async {
  final prefs = localStorage.sharedPreference;

  // ==# Register dependencies with GetIt for core services
  locator.registerLazySingleton<LocalStorage>(() => localStorage);
  locator.registerLazySingleton<RequestHandler>(() => RequestHandler(dio: Dio()));
  locator.registerLazySingleton<StorageController>(() => StorageController(prefs: prefs));

  // ==# UI Controllers using GetX lazyPut for screen management
  Get.lazyPut(() => HomePageController(), fenix: true);
  Get.lazyPut(() => DashboardBottomController(), fenix: true);
  Get.lazyPut(() => VideoDetailsController(), fenix: true);
  Get.lazyPut(() => MyAccountController(), fenix: true);

  // ==# Register GetIt services within GetX for further access
  Get.lazyPut(() => locator<RequestHandler>(), fenix: true);
  Get.lazyPut(() => locator<StorageController>(), fenix: true);

}

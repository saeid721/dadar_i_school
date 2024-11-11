
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/splash_screen/view/splash_screen.dart';
import 'domain/local/preferences/local_storage.dart';
import 'domain/server/http_client/app_config.dart';
import 'global/constants/enum.dart';
import 'global/method/get_device_info.dart';
import 'initializer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeApp();
  }

  // ==# App Initialization Logic
  Future<void> _initializeApp() async {
    LocalStorage localStorage = LocalStorage();
    AppUrlExtention.setUrl(UrlLink.isDev);
    await localStorage.initLocalStorage();
    await init(localStorage);
    await GetDeviceInfo.getDeviceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
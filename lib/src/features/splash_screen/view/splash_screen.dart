import 'dart:async';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../domain/server/http_client/request_handler.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../home_screen/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    route();

    // Reset to portrait mode when exiting full-screen
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitUp,
    ]);
  }

  // void route() {
  //   Timer(const Duration(seconds: 3), () {
  //     Get.offAll(() => const HomeScreen());
  //   });
  // }
  void route() {
    Timer(const Duration(seconds: 3), () {
      // Register dependency here before moving to HomeScreen
      if (!Get.isRegistered<RequestHandler>()) {
        Get.put<RequestHandler>(RequestHandler(dio: Dio()));
      }

      Get.offAll(() => const HomeScreen());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: size(context).height,
        width: size(context).width,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.5, 0.0),
            stops: [0.0, 1.0],
            colors: [
              const Color(0xFF361334),
              const Color(0xFF4150B5),
            ],
          ),
        ),
        child: const Center(
          child: GlobalImageLoader(
            imagePath: Images.appLogo,
            width: 250,
            fit: BoxFit.fill,
            imageFor: ImageFor.asset,
          ),
        ),
      ),
    );
  }
}

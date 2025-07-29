//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../global/constants/colors_resources.dart';
// import '../controller/auth_controller.dart';
// import 'login_screen.dart';
// import 'signup_screen.dart';
//
// class AuthScreen extends StatelessWidget {
//   const AuthScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AuthController>(builder: (authController){
//       return StatefulBuilder(
//           builder: (ctx, buildSetState){
//             return AlertDialog(
//               backgroundColor: ColorRes.appNavyColor.withValues(alpha: 0.9),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               contentPadding: const EdgeInsets.symmetric(horizontal: 15),
//               content: SizedBox(
//                 width: Get.width,
//                 child: NotificationListener<OverscrollIndicatorNotification>(
//                   onNotification: (overScroll) {
//                     overScroll.disallowIndicator();
//                     return true;
//                   },
//                   child: SingleChildScrollView(
//                     child: authController.isLoginScreen
//                         ? LoginScreen(
//                         onSwitch: () {
//                           buildSetState(() {
//                             authController.toggleScreen();
//                           });
//                         })
//                         : SignUpScreen(
//                       onSwitch: () {
//                         buildSetState(() {
//                           authController.toggleScreen();
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }
//       );
//     });
//   }
// }

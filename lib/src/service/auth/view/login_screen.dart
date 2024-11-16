//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dadar_i_school/src/service/auth/controller/auth_controller.dart';
// import '../../../domain/local/preferences/local_storage.dart';
// import '../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../global/constants/colors_resources.dart';
// import '../../../global/constants/images.dart';
// import '../../../global/utils/show_toast.dart';
// import '../../../global/widget/global_bottom_widget.dart';
// import '../../../global/widget/global_couple_text_button.dart';
// import '../../../global/widget/global_image_loader.dart';
// import '../../../global/widget/global_sized_box.dart';
// import '../../../global/widget/global_text.dart';
// import '../../../global/widget/global_textform_field.dart';
// import '../../../initializer.dart';
//
// class LoginScreen extends StatefulWidget {
//   final VoidCallback onSwitch;
//   const LoginScreen({
//     super.key,
//     required this.onSwitch
//   });
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   TextEditingController emailCon = TextEditingController(text: "01612936283");
//   TextEditingController passCon = TextEditingController(text: "12345");
//
//   final authController = Get.find<AuthController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LocationController>(builder: (locationController){
//       return GetBuilder<AuthController>(builder: (authController){
//         return Column(
//           children: [
//             sizedBoxH(10),
//             SizedBox(
//               height: 30, width: size(context).width,
//               child: Stack(
//                 children: [
//                   const Center(
//                     child: GlobalText(
//                       str: "Log In",
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: GestureDetector(
//                       onTap: (){
//                         Get.back();
//                       },
//                       child: const GlobalImageLoader(
//                         imagePath: Images.close,
//                         height: 22,
//                         width: 22,
//                         color: ColorRes.appCeruleanColor,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//
//             sizedBoxH(10),
//             GlobalTextFormField(
//               controller: emailCon,
//               titleText: 'Phone',
//               filled: true,
//               fillColor: ColorRes.listTileBackColor,
//               isDense: true,
//             ),
//
//             sizedBoxH(8),
//             GlobalTextFormField(
//               controller: passCon,
//               titleText: 'Password',
//               filled: true,
//               fillColor: ColorRes.listTileBackColor,
//               isPasswordField: true,
//               isDense: true,
//             ),
//
//             sizedBoxH(5),
//             const Align(
//               alignment: Alignment.centerRight,
//               child: GlobalText(
//                 str: "Forget Password?",
//                 color: ColorRes.appCeruleanColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12,
//               ),
//             ),
//
//             sizedBoxH(30),
//             GlobalButtonWidget(
//               str: "Log In",
//               height: 40,
//               buttomColor: ColorRes.appCeruleanColor,
//               radius: 8,
//               textSize: 13,
//               onTap: () async{
//                 if(emailCon.text.isNotEmpty){
//                   if(passCon.text.isNotEmpty){
//                     final currentAddress = locator<LocalStorage>().getString(key: StorageKeys.currentAddress);
//
//                     if(currentAddress != null){
//                       await Get.showOverlay(
//                         loadingWidget: const OverlayLoadingIndicator(),
//                         asyncFunction: () async {
//                           await authController.reqLogIn(
//                               email: emailCon.text.trim(),
//                               password: passCon.text.trim(),
//                               stateChange: (){
//                                 Navigator.pop(context);
//                               }
//                           );
//                         },
//                       );
//                     } else{
//                      // locationController.checkLocationPermission();
//                     }
//
//
//                   } else{
//                     showCustomSnackBar("Password is Required", icon: Icons.info);
//                   }
//                 } else{
//                   showCustomSnackBar("Email is Required", icon: Icons.info);
//                 }
//
//               },
//             ),
//
//             sizedBoxH(10),
//             GestureDetector(
//               onTap: widget.onSwitch,
//               child: const Align(
//                 alignment: Alignment.center,
//                 child: CoupleTextButton(
//                     firstText: "Don't have and any account? ",
//                     secondText: "Sign Up"
//                 ),
//               ),
//             ),
//
//             sizedBoxH(30),
//           ],
//         );
//       });
//     });
//   }
// }

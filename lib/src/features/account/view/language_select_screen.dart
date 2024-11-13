//
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:dadar_i_school/src/global/utils/show_toast.dart';
// import '../../../domain/local/preferences/local_storage.dart';
// import '../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../global/constants/colors_resources.dart';
// import '../../../global/widget/global_bottom_widget.dart';
// import '../../../global/widget/global_sized_box.dart';
// import '../../../global/widget/global_text.dart';
// import '../../../initializer.dart';
// import '../../dashboard_bottom_navigation_bar/dashboard_bottom_navigation_bar.dart';
// import '../controller/account_controller.dart';
//
// class LanguageSelectScreen extends StatefulWidget {
//   const LanguageSelectScreen({super.key});
//
//   @override
//   State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
// }
//
// class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
//   int? selectLanguage;
//   String? selectLanguageId;
//   String? selectLanguageName;
//   String? selectLanguageCode;
//
//   @override
//   void initState() {
//     super.initState();
//     AccountController.current.getLanguageList();
//     _loadSavedLanguage();
//   }
//
//   Future<void> _loadSavedLanguage() async {
//     final savedLanguageCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//     log("Saved Lang Id: $savedLanguageCode");
//
//     Future.delayed(const Duration(milliseconds: 300), () {
//       if (savedLanguageCode != null) {
//         final savedIndex = AccountController.current.languageModel?.data?.indexWhere(
//                 (language) => language.code.toString() == savedLanguageCode);
//
//         if (savedIndex != null && savedIndex != -1) {
//           setState(() {
//             selectLanguage = savedIndex;
//             selectLanguageCode = savedLanguageCode;
//           });
//         }
//
//       } else{
//         if (AccountController.current.languageModel?.data?.isNotEmpty ?? false) {
//           setState(() {
//             selectLanguage = 0;
//             selectLanguageCode = AccountController.current.languageModel?.data?[0].code.toString();
//           });
//         }
//       }
//
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AccountController>(builder: (accountController) {
//       return StatefulBuilder(builder: (ctx, buildSetState) {
//         return Container(
//           height: 400,
//           width: size(context).width,
//           margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//           decoration: BoxDecoration(
//               color: ColorRes.appBackColor,
//               borderRadius: BorderRadius.circular(10)),
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: Column(
//             children: [
//               sizedBoxH(10),
//               Container(
//                 height: 4,
//                 width: 80,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: ColorRes.grey.withOpacity(0.3)),
//               ),
//               sizedBoxH(10),
//               const Align(
//                 alignment: Alignment.bottomLeft,
//                 child: GlobalText(
//                   str: "Language Selection",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               sizedBoxH(10),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: accountController.languageModel?.data?.length ?? 0,
//                     shrinkWrap: true,
//                     itemBuilder: (ctx, index) {
//                       final languageData = accountController.languageModel?.data?[index];
//                       return GestureDetector(
//                         onTap: () {
//                           buildSetState(() {
//                             selectLanguage = index;
//                             selectLanguageId = languageData?.id.toString();
//                             selectLanguageName = languageData?.name.toString();
//                             selectLanguageCode = languageData?.code.toString();
//                           });
//                         },
//                         child: Container(
//                           color: Colors.transparent,
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 5),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               selectLanguage == index
//                                   ? Container(
//                                 height: 22,
//                                 width: 22,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: ColorRes.appRedColor),
//                                 child: const Icon(
//                                   Icons.check,
//                                   color: ColorRes.white,
//                                   size: 18,
//                                 ),
//                               )
//                                   : Container(
//                                 height: 22,
//                                 width: 22,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     border: Border.all(
//                                         color: ColorRes.appRedColor,
//                                         width: 1)),
//                               ),
//                               sizedBoxW(15),
//                               Expanded(
//                                 child: SizedBox(
//                                   child: GlobalText(
//                                     str: languageData?.name ?? "",
//                                     fontWeight: FontWeight.w500,
//                                     color: ColorRes.white,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               sizedBoxH(10),
//               GlobalButtonWidget(
//                 str: "Save",
//                 height: 45,
//                 buttomColor: ColorRes.appRedColor,
//                 textSize: 13,
//                 onTap: () {
//                   if (selectLanguageCode != null) {
//                     locator<LocalStorage>().setString(key: StorageKeys.langCodeId, value: selectLanguageId ?? '1');
//                     locator<LocalStorage>().setString(key: StorageKeys.langCodeName, value: selectLanguageName ?? 'English');
//                     locator<LocalStorage>().setString(key: StorageKeys.langCode, value: selectLanguageCode ?? 'en');
//
//                     log('Selected language ID: $selectLanguageId');
//                     log('Selected language Code: $selectLanguageCode');
//                     log('Selected language Name: $selectLanguageName');
//                     Get.offAll(()=> const DashboardBottomNavigationBar());
//                   } else {
//                     showCustomSnackBar("No Language Selected");
//                   }
//                 },
//               ),
//               sizedBoxH(10)
//             ],
//           ),
//         );
//       });
//     });
//   }
// }

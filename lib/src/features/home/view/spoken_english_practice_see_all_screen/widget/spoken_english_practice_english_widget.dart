// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../global/widget/global_progress_hub.dart';
// import '../../../controller/home_controller.dart';
// import '../spoken_english_practice_see_all_screen.dart';
// import '../spoken_english_practice_video_details_screen.dart';
// import '../../widget/english_course_menu_widget.dart';
// import '../../english_grammar_course_see_all_screen/widget/english_grammar_course_see_all_widget.dart';
//
// class SpokenEnglishPracticeWidget extends StatefulWidget {
//   final String id;
//
//   const SpokenEnglishPracticeWidget({
//     super.key,
//     required this.id,
//   });
//
//   @override
//   State<SpokenEnglishPracticeWidget> createState() => _SpokenEnglishPracticeWidgetState();
// }
//
// class _SpokenEnglishPracticeWidgetState extends State<SpokenEnglishPracticeWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(builder: (homePageController) {
//       return ProgressHUD(
//         inAsyncCall: homePageController.isLoading,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             GlobalCourseHeader(
//               title: "Spoken English Practice",
//               subtitle: "Practice makes perfect",
//               icon: Icons.mic,
//               gradientColors: [Colors.orange[400]!, Colors.orange[600]!],
//               seeAllScreen: const SpokenEnglishPracticeSeeAllScreen(),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: homePageController.spokenEnglishPracticeModel?.spokenEnglishPracticeList?.map((recent) {
//                         return SpokenEnglishPracticeMenuWidget(
//                           thumbnail: recent.thumbnail ?? "",
//                           title: recent.title ?? "",
//                           onTap: () {
//                             Get.to(() => SpokenEnglishPracticeVideoDetailsScreen(
//                                   id: recent.id.toString(),
//                                   title: recent.title ?? "",
//                                   shortDescription: recent.shortDescription ?? "",
//                                   thumbnail: recent.thumbnail ?? "",
//                                   youtubeLink: recent.youtubeLink ?? "",
//                                 ));
//                           },
//                         );
//                       }).toList() ??
//                       [],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

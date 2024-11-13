// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../global/widget/global_sized_box.dart';
// import '../../../../video_details/view/movie_video_details_screen.dart';
// import '../../../../video_details/view/series_video_details_screen.dart';
// import '../../../controller/home_controller.dart';
// import '../../../model/home_section_model.dart';
// import '../../components/home_section_see_all/home_section_recent_see_all_screen.dart';
// import '../home_shimmer_widget/home_section_recent_shimmer.dart';
// import '../movie_menu_bar_widget.dart';
// import '../basic_english_course_menu_widget.dart';
//
// class HomeSectionRecentWidget extends StatefulWidget {
//   final HomeSectionData? homeSectionData;
//   const HomeSectionRecentWidget({
//     super.key,
//     required this.homeSectionData
//   });
//
//   @override
//   State<HomeSectionRecentWidget> createState() => _HomeSectionRecentWidgetState();
// }
//
// class _HomeSectionRecentWidgetState extends State<HomeSectionRecentWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(builder: (homePageController){
//       return homePageController.homeSectionRecentModel != null ? Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: homePageController.homeSectionRecentModel?.data?.isNotEmpty ?? false ? Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             sizedBoxH(10),
//             MovieMenuBarWidget(
//                 text: widget.homeSectionData?.title ?? "",
//                 seeAllOnTap: (){
//                   Get.to(()=> HomeSectionRecentSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
//                 }
//             ),
//
//             sizedBoxH(5),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: homePageController.homeSectionRecentModel?.data?.map((recent) {
//
//                   if(recent.customData != null){
//                     return BasicEnglishCourseMenuWidget(
//                       img: "${recent.customData?.thumbnail}",
//                       title: recent.customData?.title ?? "",
//                       //subText: recent.videoAccess == true ? "Premium" : "Free",
//                       onTap: () {
//                         if(recent.type == "movie"){
//                           Get.to(()=> MovieVideoDetailsScreen(
//                             slug: recent.slug ?? "",
//                           ));
//                         } else if(recent.type == "series"){
//                           Get.to(()=> SeriesVideoDetailsScreen(
//                             slug: recent.slug ?? "",
//                           ));
//                         } else if(recent.type == "season"){
//                           Get.to(()=> SeriesVideoDetailsScreen(
//                             slug: recent.series?.slug ?? "",
//                           ));
//                         } else if(recent.type == "episode"){
//                           Get.to(()=> SeriesVideoDetailsScreen(
//                             slug: recent.season?.series?.slug ?? "",
//                           ));
//                         } else{
//
//                         }
//                       },
//                     );
//
//                   } else if(recent.type == "movie"){
//                     return BasicEnglishCourseMenuWidget(
//                       img: "${recent.thumbnail}",
//                       title: recent.title ?? "",
//                       //subText: recent.videoAccess == true ? "Premium" : "Free",
//                       onTap: () {
//                         Get.to(()=> MovieVideoDetailsScreen(
//                           slug: recent.slug ?? "",
//                         ));
//                       },
//                     );
//                   } else if(recent.type == "series"){
//                     return BasicEnglishCourseMenuWidget(
//                       img: "${recent.thumbnail}",
//                       title: recent.title ?? "",
//                       //subText: recent.videoAccess == true ? "Premium" : "Free",
//                       onTap: () {
//                         Get.to(()=> SeriesVideoDetailsScreen(
//                           slug: recent.slug ?? "",
//                         ));
//                       },
//                     );
//                   } else if(recent.type == "season"){
//                     return BasicEnglishCourseMenuWidget(
//                       img: "${recent.series?.thumbnail}",
//                       title: recent.series?.title ?? "",
//                       //subText: recent.videoAccess == true ? "Premium" : "Free",
//                       onTap: () {
//                         Get.to(()=> SeriesVideoDetailsScreen(
//                           slug: recent.series?.slug ?? "",
//                         ));
//                       },
//                     );
//                   } else if(recent.type == "episode"){
//                     return BasicEnglishCourseMenuWidget(
//                       img: "${recent.series?.thumbnail}",
//                       title: recent.series?.title ?? "",
//                       //subText: recent.videoAccess == true ? "Premium" : "Free",
//                       onTap: () {
//                         Get.to(()=> SeriesVideoDetailsScreen(
//                           slug: recent.season?.series?.slug ?? "",
//                         ));
//                       },
//                     );
//                   } else{
//                     return Container();
//                   }
//
//                 }).toList() ?? [],
//               ),
//             ),
//           ],
//         ) : const SizedBox.shrink()
//       ) : homeSectionRecentShimmer(homePageController.shimmerList);
//     });
//   }
// }
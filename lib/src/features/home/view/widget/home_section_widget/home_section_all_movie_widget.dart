//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../domain/local/preferences/local_storage.dart';
// import '../../../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../../../global/widget/global_sized_box.dart';
// import '../../../../../initializer.dart';
// import '../../../../../service/language_check/language_check.dart';
// import '../../../../video_details/view/movie_video_details_screen.dart';
// import '../../../controller/home_controller.dart';
// import '../../../model/home_section_model.dart';
// import '../../components/home_section_see_all/home_section_all_movie_see_all_screen.dart';
// import '../home_shimmer_widget/home_section_recent_shimmer.dart';
// import '../movie_menu_bar_widget.dart';
// import '../basic_english_course_enu_widget.dart';
//
// class HomeSectionAllMovieWidget extends StatefulWidget {
//   final HomeSectionData? homeSectionData;
//   const HomeSectionAllMovieWidget({
//     super.key,
//     this.homeSectionData
//   });
//
//   @override
//   State<HomeSectionAllMovieWidget> createState() => _HomeSectionAllMovieWidgetState();
// }
//
// class _HomeSectionAllMovieWidgetState extends State<HomeSectionAllMovieWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//     return GetBuilder<HomePageController>(builder: (homePageController){
//       return homePageController.homeSectionAllMovieModel != null ? Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: homePageController.homeSectionAllMovieModel?.data?.isNotEmpty ?? false ? Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             sizedBoxH(10),
//             MovieMenuBarWidget(
//                 text: LanguageCheck.checkLanguage(
//                   langCode: langCode,
//                   enText: widget.homeSectionData?.title ?? "All Movies",
//                   bnText: widget.homeSectionData?.titleBn ?? "সব সিনেমা",
//                   hiText: widget.homeSectionData?.titleHi ?? "सभी फिल्में",
//                   arText: widget.homeSectionData?.titleAr ?? "جميع الأفلام",
//                 ),
//                 seeAllOnTap: (){
//                   Get.to(()=> const HomeSectionAllMovieSeeAllScreen());
//                 }
//             ),
//
//             sizedBoxH(5),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: homePageController.homeSectionAllMovieModel?.data?.map((movie) {
//                   return BasicEnglishCourseMenuWidget(
//                     img: "${movie.thumbnail}",
//                     title: LanguageCheck.checkLanguage(
//                       langCode: langCode,
//                       enText: movie.title ?? "",
//                       bnText: movie.titleBn ?? "",
//                       hiText: movie.titleHi ?? "",
//                       arText: movie.titleAr ?? "",
//                     ),
//                    // subText: movie.videoAccess == true ? "Premium" : "Free",
//                     onTap: () {
//                       Get.to(()=> MovieVideoDetailsScreen(
//                         slug: movie.slug ?? "",
//                       ));
//                     },
//                   );
//                 }).toList() ?? [],
//               ),
//             ),
//
//           ],
//         ) : const SizedBox.shrink()
//       ) :  homeSectionRecentShimmer(homePageController.shimmerList);
//     });
//   }
// }

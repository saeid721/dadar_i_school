//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../domain/local/preferences/local_storage.dart';
// import '../../../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../../../global/widget/global_sized_box.dart';
// import '../../../../../initializer.dart';
// import '../../../../../service/language_check/language_check.dart';
// import '../../../../video_details/view/series_video_details_screen.dart';
// import '../../../controller/home_controller.dart';
// import '../../../model/home_section_model.dart';
// import '../../components/home_section_see_all/home_section_top_series_see_all_screen.dart';
// import '../home_shimmer_widget/home_section_recent_shimmer.dart';
// import '../movie_menu_bar_widget.dart';
// import '../basic_english_course_menu_widget.dart';
//
// class HomeSectionTopSeriesWidget extends StatefulWidget {
//   final HomeSectionData? homeSectionData;
//   const HomeSectionTopSeriesWidget({
//     super.key,
//     required this.homeSectionData
//   });
//
//   @override
//   State<HomeSectionTopSeriesWidget> createState() => _HomeSectionTopSeriesWidgetState();
// }
//
// class _HomeSectionTopSeriesWidgetState extends State<HomeSectionTopSeriesWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//     return GetBuilder<HomePageController>(builder: (homePageController){
//       return homePageController.homeSectionTopSeriesModel != null ? Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: homePageController.homeSectionTopSeriesModel?.data?.isNotEmpty ?? false ? Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             sizedBoxH(10),
//             MovieMenuBarWidget(
//                 text: LanguageCheck.checkLanguage(
//                   langCode: langCode,
//                   enText: widget.homeSectionData?.title ?? "",
//                   bnText: widget.homeSectionData?.titleBn ?? "",
//                   hiText: widget.homeSectionData?.titleHi ?? "",
//                   arText: widget.homeSectionData?.titleAr ?? "",
//                 ),
//                 seeAllOnTap: (){
//                   Get.to(()=> HomeSectionTopSeriesSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
//
//                 }
//             ),
//
//             sizedBoxH(5),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: homePageController.homeSectionTopSeriesModel?.data?.map((series) {
//                   return HomeTopSeriesMenuWidget(
//                     img: "${series.thumbnail}",
//                     text: LanguageCheck.checkLanguage(
//                       langCode: langCode,
//                       enText: series.title ?? "",
//                       bnText: series.titleBn ?? "",
//                       hiText: series.titleHi ?? "",
//                       arText: series.titleAr ?? "",
//                     ),
//                     subText: series.videoAccess == true ? "Premium" : "Free",
//                     onTap: () {
//                       Get.to(()=> SeriesVideoDetailsScreen(
//                         slug: series.slug ?? "",
//                       ));
//                     },
//                   );
//                 }).toList() ?? [],
//               )
//             ),
//           ],
//         ) : const SizedBox.shrink()
//       ) : homeSectionRecentShimmer(homePageController.shimmerList);
//     });
//   }
// }
//
// // if(movie.type == 'movie'){
// //   return ListView.builder(
// //     itemCount: movie.trailers?.length ?? 0,
// //     physics: const NeverScrollableScrollPhysics(),
// //     shrinkWrap: true,
// //     itemBuilder: (ctx, index) {
// //
// //     },
// //   );
// // }

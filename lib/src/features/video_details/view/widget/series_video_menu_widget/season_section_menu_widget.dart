//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../domain/local/preferences/local_storage.dart';
// import '../../../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../../../global/widget/global_sized_box.dart';
// import '../../../../../initializer.dart';
// import '../../../../../service/language_check/language_check.dart';
// import '../../../../home/view/widget/home_shimmer_widget/home_section_recent_shimmer.dart';
// import '../../../../home/view/widget/movie_menu_bar_widget.dart';
// import '../../../controller/video_details_controller.dart';
// import '../../episode_video_details_screen.dart';
// import 'series_section_menu_widget.dart';
//
// class SeriesDetailsSeriesMenuScreen extends StatefulWidget {
//   const SeriesDetailsSeriesMenuScreen({super.key});
//
//   @override
//   State<SeriesDetailsSeriesMenuScreen> createState() => _SeriesDetailsSeriesMenuScreenState();
// }
//
// class _SeriesDetailsSeriesMenuScreenState extends State<SeriesDetailsSeriesMenuScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//     return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
//       final seriesVideoDetailsData = videoDetailsController.seriesVideoDetailsModel?.data;
//       return videoDetailsController.seriesVideoDetailsModel != null ? Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: seriesVideoDetailsData?.seasons?.isNotEmpty ?? false ? Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: seriesVideoDetailsData?.seasons?.asMap().entries.map((season){
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   sizedBoxH(10),
//                   MovieMenuBarWidget(
//                       text: LanguageCheck.checkLanguage(
//                         langCode: langCode,
//                         enText: "Season ${season.value.seasonNumber ?? ""}",
//                         bnText: "Season ${season.value.seasonNumber ?? ""}",
//                         hiText: "Season ${season.value.seasonNumber ?? ""}",
//                         arText: "Season ${season.value.seasonNumber ?? ""}",
//                       ),
//                       isSeeAll: false,
//                       seeAllOnTap: (){}
//                   ),
//
//                   sizedBoxH(5),
//                   SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: season.value.episodes?.map((episode) {
//                           return SeriesDetailsSeriesMenuWidget(
//                             img: "${episode.thumbnail}",
//                             text: LanguageCheck.checkLanguage(
//                               langCode: langCode,
//                               enText: episode.title ?? "",
//                               bnText: episode.titleBn ?? "",
//                               hiText: episode.titleHi ?? "",
//                               arText: episode.titleAr ?? "",
//                             ),
//                             subText: episode.videoAccess == true ? "Premium" : "Free",
//                             // seriesVideoDetailsSeasons: seriesVideoDetailsData.seasons ?? [],
//                             onTap: () {
//                               Get.to(()=> EpisodeVideoDetailsScreen(
//                                 episode: episode,
//                                 initImg: episode.thumbnail ?? ""
//                               ));
//                             },
//                           );
//                         }).toList() ?? [],
//                       )
//                   ),
//                 ],
//               );
//             }).toList() ?? [],
//           ) : const SizedBox.shrink()
//       ) : homeSectionRecentShimmer(videoDetailsController.shimmerList);
//     });
//   }
// }
//
// // final dubbedList = episode.dubbed?.where((dubbed) => dubbed.language?.code.toString() == langCode).toList();
// //
// // if (dubbedList != null && dubbedList.isNotEmpty) {
// //
// //
// // // if (dubbedList != null && dubbedList.isNotEmpty) {
// // //   Get.to(()=> ListView.builder(
// // //     itemCount: dubbedList.length,
// // //     physics: const NeverScrollableScrollPhysics(),
// // //     shrinkWrap: true,
// // //     itemBuilder: (ctx, index) {
// // //       final dubbed = dubbedList[index];
// // //       return EpisodeVideoDetailsScreen(
// // //         videoSrc: dubbed.video ?? "",
// // //         initImg: episode.thumbnail ?? "",
// // //         isBack: false,
// // //       );
// // //     },
// // //   ));
// //
// //   // showDialog(
// //   //     context: context,
// //   //     builder: (ctx) {
// //   //       return Column(
// //   //         mainAxisAlignment: MainAxisAlignment.center,
// //   //         children: [
// //   //           ListView.builder(
// //   //             itemCount: dubbedList.length,
// //   //             physics: const NeverScrollableScrollPhysics(),
// //   //             shrinkWrap: true,
// //   //             itemBuilder: (ctx, index) {
// //   //               final dubbed = dubbedList[index];
// //   //               return Material(
// //   //                 child: VideoPlayerDetailsWidget(
// //   //                   videoSrc: dubbed.video ?? "",
// //   //                   initImg: episode.thumbnail ?? "",
// //   //                   isBack: false,
// //   //                 ),
// //   //               );
// //   //             },
// //   //           ),
// //   //         ],
// //   //       );
// //   //     }
// //   // );
// // } else {
// //   showCustomSnackBar("No trailer available in the selected language.", icon: Icons.info);
// // }

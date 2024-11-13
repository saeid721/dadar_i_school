//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../domain/local/preferences/local_storage.dart';
// import '../../../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../../../initializer.dart';
// import '../../../../../service/language_check/language_check.dart';
// import '../../../../video_details/view/series_video_details_screen.dart';
// import '../../../model/home_section/home_section_poster_slider_series_model.dart';
// import '../home_section_widget/home_section_poster_series_carousel_slider_widget.dart';
//
// class HomeSectionSeriesSliderPosterWidget extends StatefulWidget {
//   final HomeSectionPosterSliderSeriesData? series;
//   const HomeSectionSeriesSliderPosterWidget({
//     super.key,
//     required this.series
//   });
//
//   @override
//   State<HomeSectionSeriesSliderPosterWidget> createState() => _HomeSectionSeriesSliderPosterWidgetState();
// }
//
// class _HomeSectionSeriesSliderPosterWidgetState extends State<HomeSectionSeriesSliderPosterWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//
//     return HomeSectionPosterSeriesCarouselSliderWidget(
//       img: "${widget.series?.thumbnail}",
//       text: LanguageCheck.checkLanguage(
//         langCode: langCode,
//         enText: widget.series?.title ?? "",
//         bnText: widget.series?.titleBn ?? "",
//         hiText: widget.series?.titleHi ?? "",
//         arText: widget.series?.titleAr ?? "",
//       ),
//       subText: LanguageCheck.checkLanguage(
//         langCode: langCode,
//         enText: widget.series?.description ?? "",
//         bnText: widget.series?.descriptionBn ?? "",
//         hiText: widget.series?.descriptionHi ?? "",
//         arText: widget.series?.descriptionAr ?? "",
//       ),
//       genres: widget.series?.genres ?? [],
//       imdbRating: widget.series?.imdbRating ?? 0,
//       onTap: (){},
//       streamNowOnTap: (){
//         Get.to(()=> SeriesVideoDetailsScreen(
//           slug: widget.series?.slug ?? "",
//         ));
//       },
//     );
//   }
// }

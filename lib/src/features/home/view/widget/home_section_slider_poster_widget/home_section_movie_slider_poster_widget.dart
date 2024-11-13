//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../domain/local/preferences/local_storage.dart';
// import '../../../../../domain/local/preferences/local_storage_keys.dart';
// import '../../../../../initializer.dart';
// import '../../../../../service/language_check/language_check.dart';
// import '../../../../video_details/view/movie_video_details_screen.dart';
// import '../../../model/home_section/home_section_poster_slider_movie_model.dart';
// import '../home_section_widget/home_section_slider_poster_movie_widget.dart';
//
// class HomeSectionMovieSliderPosterWidget extends StatefulWidget {
//   final HomeSectionPosterSliderMovieData? movie;
//   const HomeSectionMovieSliderPosterWidget({
//     super.key,
//     required this.movie
//   });
//
//   @override
//   State<HomeSectionMovieSliderPosterWidget> createState() => _HomeSectionMovieSliderPosterWidgetState();
// }
//
// class _HomeSectionMovieSliderPosterWidgetState extends State<HomeSectionMovieSliderPosterWidget> {
//
//   @override
//   Widget build(BuildContext context) {
//     final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
//
//     return HomeSectionPosterMovieCarouselSliderWidget(
//       img: "${widget.movie?.thumbnail}",
//       text: LanguageCheck.checkLanguage(
//         langCode: langCode,
//         enText: widget.movie?.title ?? "",
//         bnText: widget.movie?.titleBn ?? "",
//         hiText: widget.movie?.titleHi ?? "",
//         arText: widget.movie?.titleAr ?? "",
//       ),
//       subText: LanguageCheck.checkLanguage(
//         langCode: langCode,
//         enText: widget.movie?.description ?? "",
//         bnText: widget.movie?.descriptionBn ?? "",
//         hiText: widget.movie?.descriptionHi ?? "",
//         arText: widget.movie?.descriptionAr ?? "",
//       ),
//       duration: widget.movie?.duration ?? "",
//       genres: widget.movie?.genres ?? [],
//       imdbRating: widget.movie?.imdbRating ?? 0,
//       onTap: () {
//
//       },
//       streamNowOnTap: (){
//         // Get.to(()=> MovieVideoDetailsScreen(
//         //   slug: widget.movie?.slug ?? "",
//         // ));
//       },
//     );
//   }
// }

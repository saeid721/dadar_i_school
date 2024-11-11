
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../domain/server/http_client/app_config.dart';
import '../../../../../global/utils/show_toast.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../video_details/view/series_video_details_screen.dart';
import '../../../model/home_slider_model.dart';
import '../../widget/carousel_slider_widget.dart';
import '../../widget/video_player_widget.dart';

class SeriesCarouselSliderWidget extends StatefulWidget {
  final HomeSlidersData slider;
  const SeriesCarouselSliderWidget({
    super.key,
    required this.slider
  });

  @override
  State<SeriesCarouselSliderWidget> createState() => _SeriesCarouselSliderWidgetState();
}

class _SeriesCarouselSliderWidgetState extends State<SeriesCarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    return CarouselSliderWidget(
      img: "${widget.slider.series?.thumbnail}",
      text: LanguageCheck.checkLanguage(
        langCode: langCode,
        enText: widget.slider.series?.title ?? "",
        bnText: widget.slider.series?.titleBn ?? "",
        hiText: widget.slider.series?.titleHi ?? "",
        arText: widget.slider.series?.titleAr ?? "",
      ),
      subText: LanguageCheck.checkLanguage(
        langCode: langCode,
        enText: widget.slider.series?.description ?? "",
        bnText: widget.slider.series?.descriptionBn ?? "",
        hiText: widget.slider.series?.descriptionHi ?? "",
        arText: widget.slider.series?.descriptionAr ?? "",
      ),
      imdbRating: widget.slider.series?.imdbRating ?? 0,
      onTap: (){
        log("Video Details Slug: ${widget.slider.movie?.slug}");
        Get.to(()=> SeriesVideoDetailsScreen(
          slug: widget.slider.series?.slug ?? "",
        ));
      },
      watchTrailerOnTap: () {
        // Access the last season's trailers
        final seasons = widget.slider.series?.seasons;
        final lastSeason = seasons != null && seasons.isNotEmpty ? seasons.last : null;
        final trailerList = lastSeason?.trailers?.where((trailer) => trailer.languageId.toString() == langCode).toList();

        if (trailerList != null && trailerList.isNotEmpty) {
          showDialog(
            context: context,
            builder: (ctx) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    itemCount: trailerList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      final trailer = trailerList[index];
                      log("Video Url: ${AppConfig.base.url}${trailer.url}");
                      return VideoPlayerWidget(
                        videoSrc: "${AppConfig.base.url}${trailer.url}",
                        initImg: "${widget.slider.series?.thumbnail}",
                        close: true,
                      );
                    },
                  ),
                ],
              );
            },
          );
        } else {
          showCustomSnackBar("No trailer available in the selected language.", icon: Icons.info);
        }
      },

    );
  }
}

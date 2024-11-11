
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

class EpisodeCarouselSliderWidget extends StatefulWidget {
  final HomeSlidersData slider;
  const EpisodeCarouselSliderWidget({
    super.key,
    required this.slider
  });

  @override
  State<EpisodeCarouselSliderWidget> createState() => _EpisodeCarouselSliderWidgetState();
}

class _EpisodeCarouselSliderWidgetState extends State<EpisodeCarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    return CarouselSliderWidget(
      img: "${widget.slider.episode?.thumbnail}",
      text: LanguageCheck.checkLanguage(
        langCode: langCode,
        enText: widget.slider.episode?.title ?? "",
        bnText: widget.slider.episode?.titleBn ?? "",
        hiText: widget.slider.episode?.titleHi ?? "",
        arText: widget.slider.episode?.titleAr ?? "",
      ),
      subText: LanguageCheck.checkLanguage(
        langCode: langCode,
        enText: widget.slider.episode?.description ?? "",
        bnText: widget.slider.episode?.descriptionBn ?? "",
        hiText: widget.slider.episode?.descriptionHi ?? "",
        arText: widget.slider.episode?.descriptionAr ?? "",
      ),
      imdbRating: widget.slider.episode?.imdbRating ?? 0,
      onTap: (){
        log("Video Details Slug: ${widget.slider.movie?.slug}");
        Get.to(()=> SeriesVideoDetailsScreen(
          slug: widget.slider.series?.slug ?? "",
        ));
      },
      watchTrailerOnTap: () {
        // Access the last season's trailers
        final trailerList = widget.slider.season?.trailers?.where((trailer) => trailer.languageId.toString() == langCode).toList();

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

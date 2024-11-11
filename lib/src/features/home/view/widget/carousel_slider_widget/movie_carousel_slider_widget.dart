
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../domain/server/http_client/app_config.dart';
import '../../../../../global/utils/show_toast.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../video_details/view/movie_video_details_screen.dart';
import '../../../model/data.dart';
import '../../../model/home_slider_model.dart';
import '../../../model/video_model.dart';
import '../../widget/carousel_slider_widget.dart';
import '../../widget/video_player_widget.dart';

class MovieCarouselSliderWidget extends StatefulWidget {
  final BasicEnglishCourseModel slider;
  const MovieCarouselSliderWidget({
    super.key,
    required this.slider
  });

  @override
  State<MovieCarouselSliderWidget> createState() => _MovieCarouselSliderWidgetState();
}

class _MovieCarouselSliderWidgetState extends State<MovieCarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

    return CarouselSliderWidget(
      img: "${widget.slider.thumbnail}",
      text: "${widget.slider.title}",
      subText: "${widget.slider.shortDescription}",
      onTap: (){
        log("Video Details Slug: ${widget.slider.title}");
        Get.to(()=> MovieVideoDetailsScreen(
          slug: widget.slider.title ?? "",
        ));
      },
      watchTrailerOnTap: (){

        final trailerList = widget.slider.movie?.trailers?.where((trailer) => trailer.language?.code.toString() == langCode).toList();
        if (trailerList != null && trailerList.isNotEmpty) {
          showDialog(
              context: context,
              builder: (ctx) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                      itemCount: basicEnglishCourseData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        final trailer = basicEnglishCourseData[index];
                        //log("Video Url: ${AppConfig.base.url}${trailer.url}");
                        return VideoPlayerWidget(
                          videoSrc: trailer.videoUrl,
                          initImg: trailer.thumbnail,
                          close: true,
                        );
                      },
                    ),
                  ],
                );
              }
          );
        } else {
          showCustomSnackBar("No trailer available in the selected language.", icon: Icons.info);
        }

      },
    );
  }
}

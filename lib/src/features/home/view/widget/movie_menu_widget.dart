
import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/enum.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';
import '../../model/home_section/home_section_all_series_model.dart';
import '../../model/home_section/home_section_selected_series_model.dart';
import '../../model/home_section/home_section_top_series_model.dart';

class MovieMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final String subText;
  final Function() onTap;
  const MovieMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.subText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: img,
                    height: 160,
                    width: 115,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                          color: ColorRes.appRedColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          )
                      ),
                      child: GlobalText(
                        str: subText,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                )
              ],
            ),
            GlobalText(
              str: text,
              fontSize: 13,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}

class GenresMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final Function() onTap;
  const GenresMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              child: GlobalImageLoader(
                imagePath: img,
                height: 170,
                width: 150,
                fit: BoxFit.fill,
                imageFor: ImageFor.network,
              ),
            ),
            Positioned(
              bottom: 10, left: 10, right: 10,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                      color: ColorRes.black.withOpacity(0.3)
                  ),
                  child: Center(
                    child: GlobalText(
                      str: text,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeAllSeriesMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final List<HomeSectionAllSeriesSeasons> homeSectionAllSeriesSeasons;
  final Function() onTap;
  const HomeAllSeriesMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.homeSectionAllSeriesSeasons,
    required this.onTap,
  });

  bool _checkIfSeasonHasPremium(HomeSectionAllSeriesSeasons season) {
    if (season.episodes == null || season.episodes!.isEmpty) return false;
    return season.episodes!.any((episode) => episode.videoAccess == true);
  }

  bool _checkIfAnySeasonIsPremium() {
    return homeSectionAllSeriesSeasons.any((season) => _checkIfSeasonHasPremium(season));
  }

  @override
  Widget build(BuildContext context) {
    final bool isSeriesPremium = _checkIfAnySeasonIsPremium();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: img,
                    height: 160,
                    width: 115,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                          color: ColorRes.appRedColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)
                          )
                      ),
                      child: Center(
                        child: GlobalText(
                          str: isSeriesPremium ? "Premium" : "Free",
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                )
              ],
            ),
            GlobalText(
              str: text,
              fontSize: 13,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}


class HomeTopSeriesMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final List<HomeSectionTopSeriesSeasons> homeSectionAllSeriesSeasons;
  final Function() onTap;
  const HomeTopSeriesMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.homeSectionAllSeriesSeasons,
    required this.onTap,
  });

  bool _checkIfSeasonHasPremium(HomeSectionTopSeriesSeasons season) {
    if (season.episodes == null || season.episodes!.isEmpty) return false;
    return season.episodes!.any((episode) => episode.videoAccess == true);
  }

  bool _checkIfAnySeasonIsPremium() {
    return homeSectionAllSeriesSeasons.any((season) => _checkIfSeasonHasPremium(season));
  }

  @override
  Widget build(BuildContext context) {
    final bool isSeriesPremium = _checkIfAnySeasonIsPremium();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: img,
                    height: 160,
                    width: 115,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: const BoxDecoration(
                        color: ColorRes.appRedColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)
                        )
                    ),
                    child: Center(
                      child: GlobalText(
                        str: isSeriesPremium ? "Premium" : "Free",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            GlobalText(
              str: text,
              fontSize: 13,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}

class HomeSelectedSeriesMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final List<HomeSectionSelectedSeriesSeasons> homeSectionAllSeriesSeasons;
  final Function() onTap;
  const HomeSelectedSeriesMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.homeSectionAllSeriesSeasons,
    required this.onTap,
  });

  bool _checkIfSeasonHasPremium(HomeSectionSelectedSeriesSeasons season) {
    if (season.episodes == null || season.episodes!.isEmpty) return false;
    return season.episodes!.any((episode) => episode.videoAccess == true);
  }

  bool _checkIfAnySeasonIsPremium() {
    return homeSectionAllSeriesSeasons.any((season) => _checkIfSeasonHasPremium(season));
  }

  @override
  Widget build(BuildContext context) {
    final bool isSeriesPremium = _checkIfAnySeasonIsPremium();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: img,
                    height: 160,
                    width: 115,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: const BoxDecoration(
                        color: ColorRes.appRedColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)
                        )
                    ),
                    child: Center(
                      child: GlobalText(
                        str: isSeriesPremium ? "Premium" : "Free",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            GlobalText(
              str: text,
              fontSize: 13,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}


class ActionSeriesMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final List<HomeSectionSelectedSeriesSeasons> homeSectionAllSeriesSeasons;
  final Function() onTap;
  const ActionSeriesMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.homeSectionAllSeriesSeasons,
    required this.onTap,
  });

  bool _checkIfSeasonHasPremium(HomeSectionSelectedSeriesSeasons season) {
    if (season.episodes == null || season.episodes!.isEmpty) return false;
    return season.episodes!.any((episode) => episode.videoAccess == true);
  }

  bool _checkIfAnySeasonIsPremium() {
    return homeSectionAllSeriesSeasons.any((season) => _checkIfSeasonHasPremium(season));
  }

  @override
  Widget build(BuildContext context) {
    final bool isSeriesPremium = _checkIfAnySeasonIsPremium();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GlobalImageLoader(
                    imagePath: img,
                    height: 160,
                    width: 115,
                    fit: BoxFit.fill,
                    imageFor: ImageFor.network,
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: const BoxDecoration(
                        color: ColorRes.appRedColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)
                        )
                    ),
                    child: Center(
                      child: GlobalText(
                        str: isSeriesPremium ? "Premium" : "Free",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            GlobalText(
              str: text,
              fontSize: 13,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}

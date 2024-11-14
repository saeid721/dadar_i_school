
import 'package:flutter/material.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/enum.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_text.dart';

class SeriesDetailsSeriesMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  final String subText;
  // final List<SeriesVideoDetailsSeasons> seriesVideoDetailsSeasons;
  final Function() onTap;
  const SeriesDetailsSeriesMenuWidget({
    super.key,
    required this.img,
    required this.text,
    required this.subText,
    // required this.seriesVideoDetailsSeasons,
    required this.onTap,
  });

  // bool _checkIfSeasonHasPremium(SeriesVideoDetailsSeasons season) {
  //   if (season.episodes == null || season.episodes!.isEmpty) return false;
  //   return season.episodes!.any((episode) => episode.videoAccess == true);
  // }
  //
  // bool _checkIfAnySeasonIsPremium() {
  //   return seriesVideoDetailsSeasons.any((season) => _checkIfSeasonHasPremium(season));
  // }

  @override
  Widget build(BuildContext context) {
    // final bool isSeriesPremium = _checkIfAnySeasonIsPremium();

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
                        color: ColorRes.appCeruleanColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5)
                        )
                    ),
                    child: Center(
                      child: GlobalText(
                        str: subText,
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


// if(movie.type == 'movie'){
//   return ListView.builder(
//     itemCount: movie.trailers?.length ?? 0,
//     physics: const NeverScrollableScrollPhysics(),
//     shrinkWrap: true,
//     itemBuilder: (ctx, index) {
//
//     },
//   );
// }

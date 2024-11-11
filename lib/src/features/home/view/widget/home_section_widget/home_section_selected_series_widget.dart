
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../video_details/view/series_video_details_screen.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_see_all/home_section_selected_series_see_all_screen.dart';
import '../home_shimmer_widget/home_section_recent_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../movie_menu_widget.dart';

class HomeSectionSelectedSeriesWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionSelectedSeriesWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionSelectedSeriesWidget> createState() => _HomeSectionSelectedSeriesWidgetState();
}

class _HomeSectionSelectedSeriesWidgetState extends State<HomeSectionSelectedSeriesWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionSelectedSeriesModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionSelectedSeriesModel?.data?.isNotEmpty ?? false ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            MovieMenuBarWidget(
                text: LanguageCheck.checkLanguage(
                  langCode: langCode,
                  enText: widget.homeSectionData?.title ?? "",
                  bnText: widget.homeSectionData?.titleBn ?? "",
                  hiText: widget.homeSectionData?.titleHi ?? "",
                  arText: widget.homeSectionData?.titleAr ?? "",
                ),
                seeAllOnTap: (){
                  Get.to(()=> HomeSectionSelectedSeriesSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionSelectedSeriesModel?.data?.map((series) {
                  return HomeSelectedSeriesMenuWidget(
                    img: "${series.thumbnail}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: series.title ?? "",
                      bnText: series.titleBn ?? "",
                      hiText: series.titleHi ?? "",
                      arText: series.titleAr ?? "",
                    ),
                    homeSectionAllSeriesSeasons: series.seasons ?? [],
                    onTap: () {
                      Get.to(()=> SeriesVideoDetailsScreen(
                        slug: series.slug ?? "",
                      ));
                    },
                  );
                }).toList() ?? [],
              ),
            ),
          ],
        ) : const SizedBox.shrink()
      ) : homeSectionRecentShimmer(homePageController.shimmerList);
    });
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

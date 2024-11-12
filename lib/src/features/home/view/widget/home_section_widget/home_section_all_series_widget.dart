
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
import '../../components/home_section_see_all/home_section_all_series_see_all_screen.dart';
import '../home_shimmer_widget/home_section_recent_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../basic_english_course_enu_widget.dart';

class HomeSectionAllSeriesWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionAllSeriesWidget({
    super.key,
    this.homeSectionData
  });

  @override
  State<HomeSectionAllSeriesWidget> createState() => _HomeSectionAllSeriesWidgetState();
}

class _HomeSectionAllSeriesWidgetState extends State<HomeSectionAllSeriesWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionAllSeriesModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionAllSeriesModel?.data?.isNotEmpty ?? false ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            MovieMenuBarWidget(
                text: LanguageCheck.checkLanguage(
                  langCode: langCode,
                  enText: widget.homeSectionData?.title ?? "All Series",
                  bnText: widget.homeSectionData?.titleBn ?? "সব সিরিজ",
                  hiText: widget.homeSectionData?.titleHi ?? "सभी श्रृंखला",
                  arText: widget.homeSectionData?.titleAr ?? "كل السلسلة",
                ),
                seeAllOnTap: (){
                  Get.to(()=> const HomeSectionAllSeriesSeeAllScreen());
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionAllSeriesModel?.data?.map((series) {
                  return HomeAllSeriesMenuWidget(
                    img: "${series.thumbnail}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: series.title ?? "",
                      bnText: series.titleBn ?? "",
                      hiText: series.titleHi ?? "",
                      arText: series.titleAr ?? "",
                    ),
                    subText: series.videoAccess == true ? "Premium" : "Free",
                    onTap: () {
                      Get.to(()=> SeriesVideoDetailsScreen(
                        slug: series.slug ?? "",
                      ));
                    },
                  );
                }).toList() ?? [],
              )
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../initializer.dart';
import '../../../../service/language_check/language_check.dart';
import '../../../home/view/widget/home_shimmer_widget/home_section_recent_shimmer.dart';
import '../../../home/view/widget/movie_menu_bar_widget.dart';
import '../../../home/view/widget/movie_menu_widget.dart';
import '../../../video_details/view/series_video_details_screen.dart';
import '../../controller/tab_view_controller.dart';
import '../../model/genres_model.dart';
import '../components/series_trailer_see_all_screen.dart';

class SeriesThrillerWidget extends StatefulWidget {
  final GenresListData? genresListData;
  const SeriesThrillerWidget({
    super.key,
    this.genresListData
  });

  @override
  State<SeriesThrillerWidget> createState() => _SeriesThrillerWidgetState();
}

class _SeriesThrillerWidgetState extends State<SeriesThrillerWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<TabViewController>(builder: (tabViewController){
      final thrillerData = tabViewController.seriesTabListDataByGenre[widget.genresListData?.slug ?? ""];

      return thrillerData != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: thrillerData.data?.result?.isNotEmpty ?? false ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxH(10),
              MovieMenuBarWidget(
                  text: LanguageCheck.checkLanguage(
                    langCode: langCode,
                    enText: widget.genresListData?.name ?? "",
                    bnText: widget.genresListData?.nameBn ?? "",
                    hiText: widget.genresListData?.nameHi ?? "",
                    arText: widget.genresListData?.nameAr ?? "",
                  ),
                  seeAllOnTap: (){
                    Get.to(()=> SeriesTrailerSeeAllScreen(
                        genresListData: widget.genresListData
                    ));
                  }
              ),

              sizedBoxH(5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: thrillerData.data?.result?.map((series) {
                    return HomeAllSeriesMenuWidget(
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
      ) :  homeSectionRecentShimmer(tabViewController.shimmerList);
    });
  }
}

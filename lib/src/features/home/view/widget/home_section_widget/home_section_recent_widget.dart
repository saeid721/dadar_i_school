
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../video_details/view/movie_video_details_screen.dart';
import '../../../../video_details/view/series_video_details_screen.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_see_all/home_section_recent_see_all_screen.dart';
import '../home_shimmer_widget/home_section_recent_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../movie_menu_widget.dart';

class HomeSectionRecentWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionRecentWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionRecentWidget> createState() => _HomeSectionRecentWidgetState();
}

class _HomeSectionRecentWidgetState extends State<HomeSectionRecentWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionRecentModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionRecentModel?.data?.isNotEmpty ?? false ? Column(
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
                  Get.to(()=> HomeSectionRecentSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionRecentModel?.data?.map((recent) {

                  if(recent.customData != null){
                    return MovieMenuWidget(
                      img: "${recent.customData?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: recent.customData?.title ?? "",
                        bnText: recent.customData?.titleBn ?? "",
                        hiText: recent.customData?.titleHi ?? "",
                        arText: recent.customData?.titleAr ?? "",
                      ),
                      subText: recent.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: recent.slug ?? "",
                        ));
                      },
                    );
                  } else if(recent.type == "movie"){
                    return MovieMenuWidget(
                      img: "${recent.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: recent.title ?? "",
                        bnText: recent.titleBn ?? "",
                        hiText: recent.titleHi ?? "",
                        arText: recent.titleAr ?? "",
                      ),
                      subText: recent.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> MovieVideoDetailsScreen(
                          slug: recent.slug ?? "",
                        ));
                      },
                    );
                  } else if(recent.type == "series"){
                    return MovieMenuWidget(
                      img: "${recent.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: recent.title ?? "",
                        bnText: recent.titleBn ?? "",
                        hiText: recent.titleHi ?? "",
                        arText: recent.titleAr ?? "",
                      ),
                      subText: recent.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: recent.series?.slug ?? "",
                        ));
                      },
                    );
                  } else if(recent.type == "season"){
                    return MovieMenuWidget(
                      img: "${recent.series?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: recent.series?.title ?? "",
                        bnText: recent.series?.titleBn ?? "",
                        hiText: recent.series?.titleHi ?? "",
                        arText: recent.series?.titleAr ?? "",
                      ),
                      subText: recent.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: recent.series?.slug ?? "",
                        ));
                      },
                    );
                  } else if(recent.type == "episode"){
                    return MovieMenuWidget(
                      img: "${recent.series?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: recent.series?.title ?? "",
                        bnText: recent.series?.titleBn ?? "",
                        hiText: recent.series?.titleHi ?? "",
                        arText: recent.series?.titleAr ?? "",
                      ),
                      subText: recent.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: recent.series?.slug ?? "",
                        ));
                      },
                    );
                  } else{
                    return Container();
                  }

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

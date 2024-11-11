
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
import '../../components/home_section_see_all/home_section_upcoming_see_all_screen.dart';
import '../home_shimmer_widget/home_section_recent_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../movie_menu_widget.dart';

class HomeSectionUpComingWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionUpComingWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionUpComingWidget> createState() => _HomeSectionUpComingWidgetState();
}

class _HomeSectionUpComingWidgetState extends State<HomeSectionUpComingWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionUpComingModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionUpComingModel?.data?.isNotEmpty ?? false ? Column(
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
                  Get.to(()=> const HomeSectionUpComingSeeAllScreen());
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionUpComingModel?.data?.map((upcomment) {
                  if(upcomment.type == "movie"){
                    return MovieMenuWidget(
                      img: "${upcomment.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: upcomment.title ?? "",
                        bnText: upcomment.titleBn ?? "",
                        hiText: upcomment.titleHi ?? "",
                        arText: upcomment.titleAr ?? "",
                      ),
                      subText: upcomment.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> MovieVideoDetailsScreen(
                          slug: upcomment.slug ?? "",
                        ));
                      },
                    );
                  } else if(upcomment.type == "series"){
                    return MovieMenuWidget(
                      img: "${upcomment.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: upcomment.title ?? "",
                        bnText: upcomment.titleBn ?? "",
                        hiText: upcomment.titleHi ?? "",
                        arText: upcomment.titleAr ?? "",
                      ),
                      subText: upcomment.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: upcomment.slug ?? "",
                        ));
                      },
                    );
                  } else if(upcomment.type == "season"){
                    return MovieMenuWidget(
                      img: "${upcomment.series?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: upcomment.series?.title ?? "",
                        bnText: upcomment.series?.titleBn ?? "",
                        hiText: upcomment.series?.titleHi ?? "",
                        arText: upcomment.series?.titleAr ?? "",
                      ),
                      subText: upcomment.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: upcomment.series?.slug ?? "",
                        ));
                      },
                    );
                  } else if(upcomment.type == "episode"){
                    return MovieMenuWidget(
                      img: "${upcomment.series?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: upcomment.series?.title ?? "",
                        bnText: upcomment.series?.titleBn ?? "",
                        hiText: upcomment.series?.titleHi ?? "",
                        arText: upcomment.series?.titleAr ?? "",
                      ),
                      subText: upcomment.videoAccess == true ? "Premium" : "Free",
                      onTap: () {
                        Get.to(()=> SeriesVideoDetailsScreen(
                          slug: upcomment.series?.slug ?? "",
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../../video_details/view/movie_video_details_screen.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_see_all/home_section_selected_movie_see_all_screen.dart';
import '../home_shimmer_widget/home_section_recent_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../movie_menu_widget.dart';

class HomeSectionSelectedMovieWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionSelectedMovieWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionSelectedMovieWidget> createState() => _HomeSectionSelectedMovieWidgetState();
}

class _HomeSectionSelectedMovieWidgetState extends State<HomeSectionSelectedMovieWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionSelectedMovieModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionSelectedMovieModel?.data?.isNotEmpty ?? false ?  Column(
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
                  Get.to(()=> HomeSectionSelectedMovieSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionSelectedMovieModel?.data?.map((movie) {
                  return MovieMenuWidget(
                    img: "${movie.thumbnail}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: movie.title ?? "",
                      bnText: movie.titleBn ?? "",
                      hiText: movie.titleHi ?? "",
                      arText: movie.titleAr ?? "",
                    ),
                    subText: movie.videoAccess == true ? "Premium" : "Free",
                    onTap: () {
                      Get.to(()=> MovieVideoDetailsScreen(
                        slug: movie.slug ?? "",
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

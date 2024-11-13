
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_blogs_details_screen.dart';
import '../../components/home_section_see_all/home_section_blogs_see_all_screen.dart';
import '../home_shimmer_widget/home_section_genres_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../basic_english_course_menu_widget.dart';

class HomeSectionBlogsWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionBlogsWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionBlogsWidget> createState() => _HomeSectionBlogsWidgetState();
}

class _HomeSectionBlogsWidgetState extends State<HomeSectionBlogsWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionBlogsModel?.data?.result?.isNotEmpty ?? false ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionRecentModel?.data?.isNotEmpty ?? false ? Column(
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
                  Get.to(()=> const HomeSectionBlogsSeeAllScreen());
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionBlogsModel?.data?.result?.map((movie) {
                  return GenresMenuWidget(
                    img: "${movie.banner}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: movie.title ?? "",
                      bnText: movie.titleBn ?? "",
                      hiText: movie.titleHi ?? "",
                      arText: movie.titleAr ?? "",
                    ),
                    onTap: () {
                      Get.to(()=> HomeSectionBlogsDetailsScreen(
                        blogId: movie.id.toString()
                      ));
                    },
                  );
                }).toList() ?? [],
              )
            ),

          ],
        ) : const SizedBox.shrink()
      ) : homeSectionGenresShimmer(homePageController.shimmerList);
    });
  }
}

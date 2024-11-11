
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_see_all/home_section_favourite_see_all_screen.dart';
import '../home_shimmer_widget/home_section_genres_shimmer.dart';
import '../movie_menu_bar_widget.dart';
import '../movie_menu_widget.dart';

class HomeSectionFavoriteWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionFavoriteWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionFavoriteWidget> createState() => _HomeSectionFavoriteWidgetState();
}

class _HomeSectionFavoriteWidgetState extends State<HomeSectionFavoriteWidget> {

  @override
  Widget build(BuildContext context) {
    final langCodeId = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionFavoriteModel != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionFavoriteModel?.data?.isNotEmpty ?? false ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            MovieMenuBarWidget(
                text: LanguageCheck.checkLanguage(
                  langCode: langCodeId,
                  enText: widget.homeSectionData?.title ?? "",
                  bnText: widget.homeSectionData?.titleBn ?? "",
                  hiText: widget.homeSectionData?.titleHi ?? "",
                  arText: widget.homeSectionData?.titleAr ?? "",
                ),
                seeAllOnTap: (){
                  Get.to(()=> HomeSectionFavoriteSeeAllScreen(sectionId: widget.homeSectionData?.id.toString() ?? ""));
                }
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionFavoriteModel?.data?.map((movie) {
                  return GenresMenuWidget(
                    img: "${movie.image}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCodeId,
                      enText: movie.name ?? "",
                      bnText: movie.nameBn ?? "",
                      hiText: movie.nameHi ?? "",
                      arText: movie.nameAr ?? "",
                    ),
                    onTap: () {},
                  );
                }).toList() ?? [],
              ),
            ),
          ],
        ) : const SizedBox.shrink()
      ) : homeSectionGenresShimmer(homePageController.shimmerList);
    });
  }
}

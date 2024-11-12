
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../controller/home_controller.dart';
import '../../../model/home_section_model.dart';
import '../../components/home_section_see_all/home_section_genres_see_all_screen.dart';
import '../home_shimmer_widget/home_section_genres_shimmer.dart';
import '../basic_english_course_enu_widget.dart';

class HomeSectionGenresWidget extends StatefulWidget {
  final HomeSectionData? homeSectionData;
  const HomeSectionGenresWidget({
    super.key,
    required this.homeSectionData
  });

  @override
  State<HomeSectionGenresWidget> createState() => _HomeSectionGenresWidgetState();
}

class _HomeSectionGenresWidgetState extends State<HomeSectionGenresWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return homePageController.homeSectionGenresModel?.data != null ?  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: homePageController.homeSectionGenresModel?.data?.isNotEmpty ?? false ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            GlobalText(
              str: LanguageCheck.checkLanguage(
                langCode: langCode,
                enText: widget.homeSectionData?.title ?? "",
                bnText: widget.homeSectionData?.titleBn ?? "",
                hiText: widget.homeSectionData?.titleHi ?? "",
                arText: widget.homeSectionData?.titleAr ?? "",
              ),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: homePageController.homeSectionGenresModel?.data?.map((movie) {
                  return GenresMenuWidget(
                    img: "${movie.thumbnail}",
                    text: LanguageCheck.checkLanguage(
                      langCode: langCode,
                      enText: movie.name ?? "",
                      bnText: movie.nameBn ?? "",
                      hiText: movie.nameHi ?? "",
                      arText: movie.nameAr ?? "",
                    ),
                    onTap: () {
                      Get.to(()=> HomeSectionGenresSeeAllScreen(
                        genreId: movie.id.toString(),
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

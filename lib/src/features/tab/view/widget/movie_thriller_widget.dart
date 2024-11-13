
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../initializer.dart';
import '../../../home/view/widget/basic_english_course_menu_widget.dart';
import '../../../home/view/widget/home_shimmer_widget/home_section_recent_shimmer.dart';
import '../../../home/view/widget/movie_menu_bar_widget.dart';
import '../../controller/tab_view_controller.dart';
import '../../model/genres_model.dart';
import '../components/movie_tab_list_see_all_screen.dart';

class MovieThrillerWidget extends StatefulWidget {
  final GenresListData? genresListData;
  const MovieThrillerWidget({
    super.key,
    this.genresListData
  });

  @override
  State<MovieThrillerWidget> createState() => _MovieThrillerWidgetState();
}

class _MovieThrillerWidgetState extends State<MovieThrillerWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<TabViewController>(builder: (tabViewController) {
      final thrillerData = tabViewController.movieTabListDataByGenre[widget.genresListData?.slug ?? ""];

      return thrillerData != null ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: thrillerData.data?.result?.isNotEmpty ?? false ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(10),
            MovieMenuBarWidget(
              text: widget.genresListData?.name ?? "",
              seeAllOnTap: () {
                Get.to(() => MovieTrailerSeeAllScreen(
                    genresListData: widget.genresListData
                ));
              },
            ),

            sizedBoxH(5),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: thrillerData.data?.result?.map((movie) {
                  return BasicEnglishCourseMenuWidget(
                    img: "${movie.thumbnail}",
                    title: movie.title ?? "",
                    //subText: movie.videoAccess == true ? "Premium" : "Free",
                    onTap: () {
                     // Get.to(() => MovieVideoDetailsScreen(slug: movie.slug ?? ""));
                    },
                  );
                }).toList() ?? [],
              ),
            ),
          ],
        ) : const SizedBox.shrink(),
      ) : homeSectionRecentShimmer(tabViewController.shimmerList);
    });
  }
}

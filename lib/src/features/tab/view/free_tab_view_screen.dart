
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../initializer.dart';
import '../../../service/language_check/language_check.dart';
import '../../home/view/widget/movie_menu_bar_widget.dart';
import '../../home/view/widget/basic_english_course_enu_widget.dart';
import '../../video_details/view/movie_video_details_screen.dart';
import '../../video_details/view/series_video_details_screen.dart';
import '../controller/tab_view_controller.dart';
import 'components/free_tab_list_see_all_screen.dart';

class FreeTabViewScreen extends StatefulWidget {
  const FreeTabViewScreen({
    super.key
  });

  @override
  State<FreeTabViewScreen> createState() => _FreeTabViewScreenState();
}

class _FreeTabViewScreenState extends State<FreeTabViewScreen> {

  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int pageSize = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tabViewController = TabViewController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) {
      tabViewController.getFreeTabView(limit: '10');
    });


  }


  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<TabViewController>(builder: (tabViewController){
      return SingleChildScrollView(
        // controller: homePageController.scrollController,
        child: tabViewController.freeTabViewModel != null ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH(80),

                  /// ==# Favourites Movie
                  MovieMenuBarWidget(
                      text: "Free Movie",
                      seeAllOnTap: (){
                        Get.to(() => const FreeTabListSeeAllSeeAllScreen(
                          contentType: 'movie'),
                        );
                      }
                  ),
                  sizedBoxH(5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tabViewController.freeTabViewModel?.data?.movies?.map((movie){
                          return BasicEnglishCourseMenuWidget(
                            img: "${movie.thumbnail}",
                            title: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: movie.title ?? "",
                              bnText: movie.titleBn ?? "",
                              hiText: movie.titleHi ?? "",
                              arText: movie.titleAr ?? "",
                            ),
                            //subText: movie.videoAccess == true ? "Premium" : "Free",
                            onTap: () {
                              // Get.to(()=> MovieVideoDetailsScreen(
                              //   slug: movie.slug ?? "",
                              // ));
                            },
                          );
                        }).toList() ?? []
                    ),
                  ),

                  /// ==# Favourites Series
                  sizedBoxH(20),
                  MovieMenuBarWidget(
                      text: "Free Series",
                      seeAllOnTap: (){
                        Get.to(() => const FreeTabListSeeAllSeeAllScreen(
                            contentType: 'series'
                        ));
                      }
                  ),
                  sizedBoxH(5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tabViewController.freeTabViewModel?.data?.series?.map((series){
                          return BasicEnglishCourseMenuWidget(
                            img: "${series.thumbnail}",
                            title: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: series.title ?? "",
                              bnText: series.titleBn ?? "",
                              hiText: series.titleHi ?? "",
                              arText: series.titleAr ?? "",
                            ),
                            //subText: series.videoAccess == true ? "Premium" : "Free",
                            onTap: () {
                              // Get.to(()=> SeriesVideoDetailsScreen(
                              //   slug: series.slug ?? "",
                              // ));
                            },
                          );
                        }).toList() ?? []
                    ),
                  ),

                  /// ==# Favourites Episodes
                  sizedBoxH(20),
                  MovieMenuBarWidget(
                      text: "Free Episodes",
                      seeAllOnTap: (){
                        Get.to(() => const FreeTabListSeeAllSeeAllScreen(
                            contentType: 'episode'),
                        );
                      }
                  ),
                  sizedBoxH(5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tabViewController.freeTabViewModel?.data?.episodes?.map((episode){
                          return BasicEnglishCourseMenuWidget(
                            img: "${episode.thumbnail}",
                            title: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: episode.title ?? "",
                              bnText: episode.titleBn ?? "",
                              hiText: episode.titleHi ?? "",
                              arText: episode.titleAr ?? "",
                            ),
                            //subText: episode.videoAccess == true ? "Premium" : "Free",
                            onTap: () {
                              // Get.to(()=> SeriesVideoDetailsScreen(
                              //   slug: episode.season?.series?.slug ?? "",
                              // ));
                            },
                          );
                        }).toList() ?? []
                    ),
                  ),


                  /// ==# Favourites Episodes
                  sizedBoxH(20),
                  MovieMenuBarWidget(
                      text: "Free Season",
                      seeAllOnTap: (){
                        Get.to(() => const FreeTabListSeeAllSeeAllScreen(
                            contentType: 'season'),
                        );
                      }
                  ),
                  sizedBoxH(5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: tabViewController.freeTabViewModel?.data?.seasons?.map((season){
                          return BasicEnglishCourseMenuWidget(
                            img: "${season.thumbnail}",
                            title: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: season.series?.title ?? "",
                              bnText: season.series?.titleBn ?? "",
                              hiText: season.series?.titleHi ?? "",
                              arText: season.series?.titleAr ?? "",
                            ),
                            //subText: season.videoAccess == true ? "Premium" : "Free",
                            onTap: () {
                              // Get.to(()=> SeriesVideoDetailsScreen(
                              //   slug: season.series?.slug ?? "",
                              // ));
                            },
                          );
                        }).toList() ?? []
                    ),
                  ),

                  sizedBoxH(100),
                ],
              ),
            )
          ],
        ) : const SizedBox.shrink()
      );
    });
  }
}

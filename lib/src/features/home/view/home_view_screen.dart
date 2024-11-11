
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/constants/images.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../../initializer.dart';
import '../../../service/language_check/language_check.dart';
import '../../../service/location/controller/location_controller.dart';
import '../controller/home_controller.dart';
import 'widget/carousel_slider_widget/episode_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/movie_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/season_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/series_carousel_slider_widget.dart';
import 'widget/home_section_slider_poster_widget/home_section_movie_slider_poster_widget.dart';
import 'widget/home_section_slider_poster_widget/home_section_series_slider_poster_widget.dart';
import 'widget/home_section_widget/home_section_all_movie_widget.dart';
import 'widget/home_section_widget/home_section_all_series_widget.dart';
import 'widget/home_section_widget/home_section_application_features_widget.dart';
import 'widget/home_section_widget/home_section_blogs_widget.dart';
import 'widget/home_section_widget/home_section_favorite_widget.dart';
import 'widget/home_section_widget/home_section_genres_widget.dart';
import 'widget/home_section_widget/home_section_movie_poster_widget.dart';
import 'widget/home_section_widget/home_section_recent_widget.dart';
import 'widget/home_section_widget/home_section_selected_movie_widget.dart';
import 'widget/home_section_widget/home_section_selected_series_widget.dart';
import 'widget/home_section_widget/home_section_series_poster_widget.dart';
import 'widget/home_section_widget/home_section_top_movie_widget.dart';
import 'widget/home_section_widget/home_section_top_series_widget.dart';
import 'widget/home_section_widget/home_section_upcoming_widget.dart';
import 'widget/home_shimmer_widget/home_section_slider_shimmer.dart';
import 'widget/social_menu_widget.dart';

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {

  // =/# Carousel Slider
  int currentIndex = 0;
  final homeSliderCarouselController = CarouselSliderController();

  // bool isExploreClick = false;
  // List<String> exploreList = [
  //   "Latest Shows",
  //   "Latest Movies",
  //   "Upcoming on NP",
  //   "All Shows",
  //   "All Movies",
  // ];

  final homeSectionPosterMovieCarouselController = CarouselSliderController();
  final homeSectionPosterSeriesCarouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    final homePageController = HomePageController.current;

    final locationController = LocationController.current;
    locationController.checkLocationPermission();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await homePageController.getHomeSliderList();
      await homePageController.getHomeSections();
      // await homePageController.getFooterExplore();
      // await homePageController.getFooterPopularSeries();
      // await homePageController.getFooterPopularMovies();
      // await homePageController.getFooterCompany();

      if (homePageController.homeSortedList != null && homePageController.homeSortedList!.isNotEmpty) {
        log("Section Type2: ${homePageController.homeSortedList?.asMap().entries.map((homeSection) => homeSection.value.sectionType)}");

        homePageController.homeSortedList?.asMap().entries.forEach((homeSection) {
          log("Section Type: ${homeSection.value.sectionType}");
          switch (homeSection.value.sectionType) {
            case "recent":
              homePageController.getHomeSectionRecent(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
              break;
            case "genres":
              homePageController.getHomeSectionGenres(sectionId: homeSection.value.id.toString());
              break;
            case "upcoming":
              homePageController.getHomeSectionUpComing(limit: '10', sectionType: homeSection.value.sectionType);
              break;
            // case "all_movies":
            //   homePageController.getHomeSectionAllMovie(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
            //   break;
            // case "all_series":
            //   homePageController.getHomeSectionAllSeries(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
            //   break;
            // case "top_movies":
            //   homePageController.getHomeSectionTopMovie(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
            //   break;
            // case "top_series":
            //   homePageController.getHomeSectionTopSeries(limit: '10', sectionType: homeSection.value.sectionType, sectionId: homeSection.value.id.toString());
            //   break;
            // case "selected_movies":
            //   homePageController.getHomeSectionSelectMovie(sectionId: homeSection.value.id.toString());
            //   break;
            // case "selected_series":
            //   homePageController.getHomeSectionSelectSeries(sectionId: homeSection.value.id.toString());
            //   break;
            // case "slider_poster":
            //   if(homeSection.value.subSectionType == "movie"){
            //     homePageController.getHomeSectionPosterSliderMovie(sectionId: homeSection.value.id.toString());
            //   } else if(homeSection.value.subSectionType == "series"){
            //     homePageController.getHomeSectionPosterSliderSeries(sectionId: homeSection.value.id.toString());
            //   }
            //
            //   break;
            // case "application_features":
            //   homePageController.getHomeSectionApplicationFeatures();
            //   break;
            // case "favorite_personalities":
            //   homePageController.getHomeSectionFavorite(sectionId: homeSection.value.id.toString());
            //   break;
            // case "blogs":
            //   homePageController.getHomeSectionBlogs(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
            //   break;
            default:
              log("Unknown section type: ${homeSection.value.sectionType}");
              break;
          }
        });
      } else {
        log("Section Type2: No data found.");
      }
    });
  }

  Future<void> _refreshHomeViewData() async {
    final homePageController = HomePageController.current;
    await homePageController.getHomeSliderList();
    await homePageController.getHomeSections();

    if (homePageController.homeSortedList != null && homePageController.homeSortedList!.isNotEmpty) {
      log("Section Type2: ${homePageController.homeSortedList?.asMap().entries.map((homeSection) => homeSection.value.sectionType)}");

      homePageController.homeSortedList?.asMap().entries.forEach((homeSection) {
        log("Section Type: ${homeSection.value.sectionType}");
        switch (homeSection.value.sectionType) {
          case "recent":
            homePageController.getHomeSectionRecent(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
            break;
          case "genres":
            homePageController.getHomeSectionGenres(sectionId: homeSection.value.id.toString());
            break;
          case "upcoming":
            homePageController.getHomeSectionUpComing(limit: '10', sectionType: homeSection.value.sectionType);
            break;
          // case "all_movies":
          //   homePageController.getHomeSectionAllMovie(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
          //   break;
          // case "all_series":
          //   homePageController.getHomeSectionAllSeries(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
          //   break;
          // case "top_movies":
          //   homePageController.getHomeSectionTopMovie(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
          //   break;
          // case "top_series":
          //   homePageController.getHomeSectionTopSeries(limit: '10', sectionType: homeSection.value.sectionType, sectionId: homeSection.value.id.toString(),);
          //   break;
          // case "selected_movies":
          //   homePageController.getHomeSectionSelectMovie(sectionId: homeSection.value.id.toString());
          //   break;
          // case "selected_series":
          //   homePageController.getHomeSectionSelectSeries(sectionId: homeSection.value.id.toString());
          //   break;
          // case "slider_poster":
          //   homePageController.getHomeSectionPosterSliderMovie(sectionId: homeSection.value.id.toString());
          //   homePageController.getHomeSectionPosterSliderSeries(sectionId: homeSection.value.id.toString());
          //   break;
          // case "application_features":
          //   homePageController.getHomeSectionApplicationFeatures();
          //   break;
          // case "favorite_personalities":
          //   homePageController.getHomeSectionFavorite(sectionId: homeSection.value.id.toString());
          //   break;
          // case "blogs":
          //   homePageController.getHomeSectionBlogs(limit: '10', order: 'desc', page: '1', sectionType: homeSection.value.sectionType);
          //   break;
          default:
            log("Unknown section type: ${homeSection.value.sectionType}");
            break;
        }
      });
    } else {
      log("Section Type: No data found.");
    }

    setState(() {}); // Update the UI after data refresh
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController){
      return GetBuilder<HomePageController>(builder: (homePageController){
        final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
        log("Current Lang Code: $langCode");

        return RefreshIndicator(
          onRefresh: _refreshHomeViewData,
          backgroundColor: ColorRes.appBackColor,
          color: ColorRes.appRedColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ==# Carousel Slider Screen
                homePageController.homeSlidersModel?.data != null ? homePageController.homeSlidersModel?.data?.isNotEmpty ?? false ?
                CarouselSlider(
                  carouselController: homeSliderCarouselController,
                  items: homePageController.homeSlidersModel?.data?.map((slider) {

                    if(slider.sliderContentType == "movie"){
                      return MovieCarouselSliderWidget(slider: slider);

                    } else if(slider.sliderContentType == "series"){

                      if(slider.sliderSeriesUploadType == "seriesType"){
                        return SeriesCarouselSliderWidget(slider: slider);

                      } else if(slider.sliderSeriesUploadType == "seasonType"){
                        return SeasonCarouselSliderWidget(slider: slider);

                      } else if(slider.sliderSeriesUploadType == "episodeType"){
                        return EpisodeCarouselSliderWidget(slider: slider);

                      } else{
                        return Container();

                      }

                    } else{
                      return Container();

                    }

                  }).toList() ?? [],
                  options: CarouselOptions(
                    height: 550,
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: false,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ) : const SizedBox(height: 70) : homeSectionSliderShimmer(context),

                ListView.builder(
                  itemCount: homePageController.homeSortedList?.length ?? 0,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, index) {
                    final sectionData = homePageController.homeSortedList?[index];

                    if (sectionData?.sectionType == "recent") {
                      /// ==# Recent
                      return HomeSectionRecentWidget(homeSectionData: sectionData);

                    } else if (sectionData?.sectionType == "genres") {
                      /// ==# Genres
                      return HomeSectionGenresWidget(homeSectionData: sectionData);

                    } else if (sectionData?.sectionType == "upcoming") {
                      /// ==# Upcoming
                      return HomeSectionUpComingWidget(homeSectionData: sectionData);

                    }
                    // else if (sectionData?.sectionType == "poster") {
                    //   /// ==# Poster
                    //   if(sectionData?.subSectionType == "movie"){
                    //     return HomeSectionMoviePosterWidget(homeSectionData: sectionData);
                    //
                    //   } else if(sectionData?.subSectionType == "series"){
                    //     return HomeSectionSeriesPosterWidget(homeSectionData: sectionData);
                    //
                    //   } else{
                    //     return Container();
                    //   }
                    //
                    // } else if (sectionData?.sectionType == "all_movies") {
                    //   /// ==# All Movies
                    //   return HomeSectionAllMovieWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "all_series") {
                    //   /// ==# All Series
                    //   return HomeSectionAllSeriesWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "top_movies") {
                    //   /// ==# Top Movies
                    //   return HomeSectionTopMovieWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "top_series") {
                    //   /// ==# Top Series
                    //   return HomeSectionTopSeriesWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "selected_movies") {
                    //   /// ==# Selected Movies
                    //   return HomeSectionSelectedMovieWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "selected_series") {
                    //   /// ==# Selected Series
                    //   return HomeSectionSelectedSeriesWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "slider_poster") {
                    //   /// ==# Slider Poster
                    //   if(sectionData?.subSectionType == "movie"){
                    //     return homePageController.homeSectionPosterSliderMovieDataList?.isNotEmpty ?? false ?
                    //     Column(
                    //       children: [
                    //         sizedBoxH(20),
                    //         CarouselSlider(
                    //           carouselController: homeSectionPosterMovieCarouselController,
                    //           items: homePageController.homeSectionPosterSliderMovieDataList?.map((movie) {
                    //             return HomeSectionMovieSliderPosterWidget(movie: movie);
                    //           }).toList() ?? [],
                    //           options: CarouselOptions(
                    //             height: 300,
                    //             scrollPhysics: const BouncingScrollPhysics(),
                    //             aspectRatio: 2,
                    //             viewportFraction: 1,
                    //             autoPlay: true,
                    //             // autoPlayInterval: const Duration(seconds: 5),
                    //             // autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    //             onPageChanged: (index, reason) {
                    //               setState(() {
                    //                 currentIndex = index;
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ) : const SizedBox.shrink();
                    //   } else if(sectionData?.subSectionType == "series"){
                    //     return homePageController.homeSectionPosterSliderSeriesDataList?.isNotEmpty ?? false ?
                    //     Column(
                    //       children: [
                    //         CarouselSlider(
                    //           carouselController: homeSectionPosterSeriesCarouselController,
                    //           items: homePageController.homeSectionPosterSliderSeriesDataList?.map((series) {
                    //             return HomeSectionSeriesSliderPosterWidget(series: series);
                    //           }).toList() ?? [],
                    //           options: CarouselOptions(
                    //             height: 300,
                    //             scrollPhysics: const BouncingScrollPhysics(),
                    //             aspectRatio: 2,
                    //             viewportFraction: 1,
                    //             autoPlay: true,
                    //             onPageChanged: (index, reason) {
                    //               setState(() {
                    //                 currentIndex = index;
                    //               });
                    //             },
                    //           ),
                    //         ),
                    //       ],
                    //     ) : const SizedBox.shrink();
                    //   } else{
                    //     return Container();
                    //   }
                    //
                    // }  else if (sectionData?.sectionType == "application_features") {
                    //   /// ==# Application Features
                    //   return const HomeSectionApplicationFeaturesWidget();
                    //
                    // } else if (sectionData?.sectionType == "favorite_personalities") {
                    //   /// ==# Favorite Personalities
                    //   return HomeSectionFavoriteWidget(homeSectionData: sectionData);
                    //
                    // } else if (sectionData?.sectionType == "blogs") {
                    //   /// ==# Blogs
                    //   return HomeSectionBlogsWidget(homeSectionData: sectionData);
                    //
                    // }
                    else {
                      return const SizedBox.shrink();

                    }
                  },
                ),

                sizedBoxH(100),
                // Container(
                //   width: size(context).width,
                //   color: ColorRes.appColor,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       sizedBoxH(10),
                //       const GlobalImageText(
                //         str: "NP",
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //       ),
                //
                //       sizedBoxH(10),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           SocialMenuWidget(
                //             img: Images.facebookIc,
                //             onTap: (){},
                //           ),
                //
                //           sizedBoxW(10),
                //           SocialMenuWidget(
                //             img: Images.instagramIc,
                //             onTap: (){},
                //           ),
                //
                //           sizedBoxW(10),
                //           SocialMenuWidget(
                //             img: Images.linkedInIc,
                //             onTap: (){},
                //           ),
                //         ],
                //       ),
                //
                //       sizedBoxH(10),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           SocialMenuWidget(
                //             img: Images.youtubeIc,
                //             onTap: (){},
                //           ),
                //
                //           sizedBoxW(10),
                //           SocialMenuWidget(
                //             img: Images.twitterIc,
                //             onTap: (){},
                //           ),
                //         ],
                //       ),
                //
                //       sizedBoxH(30),
                //       Container(
                //         width: size(context).width,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: ColorRes.white),
                //             borderRadius: BorderRadius.circular(5)
                //         ),
                //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //         margin: const EdgeInsets.symmetric(horizontal: 15),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             GestureDetector(
                //               onTap: (){
                //                 setState(() {
                //                   isExploreClick = !isExploreClick;
                //                 });
                //               },
                //               child: const SizedBox(
                //                 child: Row(
                //                   children: [
                //                     Expanded(
                //                       child: GlobalText(
                //                         str: "Explore",
                //                         fontWeight: FontWeight.w600,
                //                       ),
                //                     ),
                //                     Icon(
                //                       Icons.arrow_drop_down_outlined,
                //                       color: ColorRes.white,
                //                       size: 18,
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //
                //             isExploreClick == true ?
                //             Padding(
                //               padding: const EdgeInsets.only(left: 20, top: 8),
                //               child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: homePageController.footerExploreModel?.data?.asMap().entries.map((item){
                //                     return Container(
                //                       padding: const EdgeInsets.symmetric(vertical: 5),
                //                       child: GlobalText(
                //                         str: LanguageCheck.checkLanguage(
                //                           langCode: langCode,
                //                           enText: item.value.pageTitle ?? "",
                //                           bnText: item.value.pageTitleBn ?? "",
                //                           hiText: item.value.pageTitleHi ?? "",
                //                           arText: item.value.pageTitleAr ?? "",
                //                         ),
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w300,
                //                       ),
                //                     );
                //                   }).toList() ?? []
                //               ),
                //             ) : const SizedBox.shrink()
                //           ],
                //         ),
                //       ),
                //
                //     sizedBoxH(10),
                //     Container(
                //       width: size(context).width,
                //       decoration: BoxDecoration(
                //           border: Border.all(width: 1, color: ColorRes.white),
                //           borderRadius: BorderRadius.circular(5)
                //       ),
                //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //       margin: const EdgeInsets.symmetric(horizontal: 15),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           GestureDetector(
                //             onTap: (){
                //               setState(() {
                //                 isExploreClick = !isExploreClick;
                //               });
                //             },
                //             child: const SizedBox(
                //               child: Row(
                //                 children: [
                //                   Expanded(
                //                     child: GlobalText(
                //                       str: "Popular Series",
                //                       fontWeight: FontWeight.w600,
                //                     ),
                //                   ),
                //                   Icon(
                //                     Icons.arrow_drop_down_outlined,
                //                     color: ColorRes.white,
                //                     size: 18,
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //
                //             isExploreClick == true ?
                //             Padding(
                //               padding: const EdgeInsets.only(left: 20, top: 8),
                //               child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: homePageController.footerPopularSeriesModel?.data?.asMap().entries.map((item){
                //                     return Container(
                //                       padding: const EdgeInsets.symmetric(vertical: 5),
                //                       child: GlobalText(
                //                         str: LanguageCheck.checkLanguage(
                //                           langCode: langCode,
                //                           enText: item.value.pageTitle ?? "",
                //                           bnText: item.value.pageTitleBn ?? "",
                //                           hiText: item.value.pageTitleHi ?? "",
                //                           arText: item.value.pageTitleAr ?? "",
                //                         ),
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w300,
                //                       ),
                //                     );
                //                   }).toList() ?? []
                //               ),
                //             ) : const SizedBox.shrink()
                //           ],
                //         ),
                //       ),
                //
                //       sizedBoxH(10),
                //       Container(
                //         width: size(context).width,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: ColorRes.white),
                //             borderRadius: BorderRadius.circular(5)
                //         ),
                //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //         margin: const EdgeInsets.symmetric(horizontal: 15),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             GestureDetector(
                //               onTap: (){
                //                 setState(() {
                //                   isExploreClick = !isExploreClick;
                //                 });
                //               },
                //               child: const SizedBox(
                //                 child: Row(
                //                   children: [
                //                     Expanded(
                //                       child: GlobalText(
                //                         str: "Popular Movies",
                //                         fontWeight: FontWeight.w600,
                //                       ),
                //                     ),
                //                     Icon(
                //                       Icons.arrow_drop_down_outlined,
                //                       color: ColorRes.white,
                //                       size: 18,
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //
                //             isExploreClick == true ?
                //             Padding(
                //               padding: const EdgeInsets.only(left: 20, top: 8),
                //               child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: homePageController.footerPopularMoviesModel?.data?.asMap().entries.map((item){
                //                     return Container(
                //                       padding: const EdgeInsets.symmetric(vertical: 5),
                //                       child: GlobalText(
                //                         str: LanguageCheck.checkLanguage(
                //                           langCode: langCode,
                //                           enText: item.value.pageTitle ?? "",
                //                           bnText: item.value.pageTitleBn ?? "",
                //                           hiText: item.value.pageTitleHi ?? "",
                //                           arText: item.value.pageTitleAr ?? "",
                //                         ),
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w300,
                //                       ),
                //                     );
                //                   }).toList() ?? []
                //               ),
                //             ) : const SizedBox.shrink()
                //           ],
                //         ),
                //       ),
                //
                //       sizedBoxH(10),
                //       Container(
                //         width: size(context).width,
                //         decoration: BoxDecoration(
                //             border: Border.all(width: 1, color: ColorRes.white),
                //             borderRadius: BorderRadius.circular(5)
                //         ),
                //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                //         margin: const EdgeInsets.symmetric(horizontal: 15),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             GestureDetector(
                //               onTap: (){
                //                 setState(() {
                //                   isExploreClick = !isExploreClick;
                //                 });
                //               },
                //               child: const SizedBox(
                //                 child: Row(
                //                   children: [
                //                     Expanded(
                //                       child: GlobalText(
                //                         str: "Company",
                //                         fontWeight: FontWeight.w600,
                //                       ),
                //                     ),
                //                     Icon(
                //                       Icons.arrow_drop_down_outlined,
                //                       color: ColorRes.white,
                //                       size: 18,
                //                     )
                //                   ],
                //                 ),
                //               ),
                //             ),
                //
                //             isExploreClick == true ?
                //             Padding(
                //               padding: const EdgeInsets.only(left: 20, top: 8),
                //               child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: homePageController.footerCompanyModel?.data?.asMap().entries.map((item){
                //                     return Container(
                //                       padding: const EdgeInsets.symmetric(vertical: 5),
                //                       child: GlobalText(
                //                         str: LanguageCheck.checkLanguage(
                //                           langCode: langCode,
                //                           enText: item.value.pageTitle ?? "",
                //                           bnText: item.value.pageTitleBn ?? "",
                //                           hiText: item.value.pageTitleHi ?? "",
                //                           arText: item.value.pageTitleAr ?? "",
                //                         ),
                //                         fontSize: 12,
                //                         fontWeight: FontWeight.w300,
                //                       ),
                //                     );
                //                   }).toList() ?? []
                //               ),
                //             ) : const SizedBox.shrink()
                //           ],
                //         ),
                //       ),
                //
                //       sizedBoxH(20),
                //       const GlobalText(
                //         str: "Copyright © 2024 NP",
                //         fontSize: 12,
                //         fontWeight: FontWeight.bold,
                //       ),
                //
                //       sizedBoxH(110),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      });
    });
  }
}


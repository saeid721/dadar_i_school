import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_sized_box.dart';
import '../controller/home_controller.dart';
import 'widget/carousel_slider_widget/carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/episode_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/movie_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/season_carousel_slider_widget.dart';
import 'widget/carousel_slider_widget/series_carousel_slider_widget.dart';
import 'widget/home_section_widget/home_section_all_movie_widget.dart';
import 'widget/home_section_widget/home_section_all_series_widget.dart';
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

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({super.key});

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {

  // =/# Carousel Slider
  int currentIndex = 0;
  final homeSliderCarouselController = CarouselSliderController();

  final homeSectionPosterMovieCarouselController = CarouselSliderController();
  final homeSectionPosterSeriesCarouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    final homePageController = HomePageController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
            case "all_movies":
              homePageController.getHomeSectionAllMovie(limit: '10');
              break;
            case "all_series":
              homePageController.getHomeSectionAllSeries(limit: '10');
              break;
            case "top_movies":
              homePageController.getHomeSectionTopMovie(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
              break;
            case "top_series":
              homePageController.getHomeSectionTopSeries(limit: '10', sectionType: homeSection.value.sectionType, sectionId: homeSection.value.id.toString());
              break;
            case "selected_movies":
              homePageController.getHomeSectionSelectMovie(sectionId: homeSection.value.id.toString());
              break;
            case "selected_series":
              homePageController.getHomeSectionSelectSeries(sectionId: homeSection.value.id.toString());
              break;

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
          case "all_movies":
            homePageController.getHomeSectionAllMovie(limit: '10');
            break;
          case "all_series":
            homePageController.getHomeSectionAllSeries(limit: '10');
            break;
          case "top_movies":
            homePageController.getHomeSectionTopMovie(limit: '10', sectionId: homeSection.value.id.toString(), sectionType: homeSection.value.sectionType);
            break;
          case "top_series":
            homePageController.getHomeSectionTopSeries(limit: '10', sectionType: homeSection.value.sectionType, sectionId: homeSection.value.id.toString(),);
            break;
          case "selected_movies":
            homePageController.getHomeSectionSelectMovie(sectionId: homeSection.value.id.toString());
            break;
          case "selected_series":
            homePageController.getHomeSectionSelectSeries(sectionId: homeSection.value.id.toString());
            break;

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
    return GetBuilder<HomePageController>(builder: (homePageController){


      return RefreshIndicator(
        onRefresh: _refreshHomeViewData,
        backgroundColor: ColorRes.appBackColor,
        color: ColorRes.appRedColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==# Carousel Slider Screen
              buildCarouselSlider(),

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

                  } else if (sectionData?.sectionType == "poster") {
                    /// ==# Poster
                    if(sectionData?.subSectionType == "movie"){
                      return HomeSectionMoviePosterWidget(homeSectionData: sectionData);

                    } else if(sectionData?.subSectionType == "series"){
                      return HomeSectionSeriesPosterWidget(homeSectionData: sectionData);

                    } else{
                      return Container();
                    }

                  } else if (sectionData?.sectionType == "all_movies") {
                    /// ==# All Movies
                    return HomeSectionAllMovieWidget(homeSectionData: sectionData);

                  } else if (sectionData?.sectionType == "all_series") {
                    /// ==# All Series
                    return HomeSectionAllSeriesWidget(homeSectionData: sectionData);

                  } else if (sectionData?.sectionType == "top_movies") {
                    /// ==# Top Movies
                    return HomeSectionTopMovieWidget(homeSectionData: sectionData);

                  } else if (sectionData?.sectionType == "top_series") {
                    /// ==# Top Series
                    return HomeSectionTopSeriesWidget(homeSectionData: sectionData);

                  } else if (sectionData?.sectionType == "selected_movies") {
                    /// ==# Selected Movies
                    return HomeSectionSelectedMovieWidget(homeSectionData: sectionData);

                  } else if (sectionData?.sectionType == "selected_series") {
                    /// ==# Selected Series
                    return HomeSectionSelectedSeriesWidget(homeSectionData: sectionData);

                  } else {
                    return const SizedBox.shrink();

                  }
                },
              ),

              sizedBoxH(100),
            ],
          ),
        ),
      );
    });
  }
}



import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../home/view/widget/home_section_widget/home_section_all_movie_widget.dart';
import '../controller/tab_view_controller.dart';
import 'widget/movie_thriller_widget.dart';

class MovieTabViewScreen extends StatefulWidget {
  const MovieTabViewScreen({super.key});

  @override
  State<MovieTabViewScreen> createState() => _MovieTabViewScreenState();
}

class _MovieTabViewScreenState extends State<MovieTabViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tabViewController = TabViewController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await tabViewController.getGenresList(type: 'movie');

      if (tabViewController.genresMovieListModel != null && tabViewController.genresMovieListModel!.data!.isNotEmpty) {
        for(var genres in tabViewController.genresMovieListModel!.data!){
          log("Section Data Slug: ${genres.slug}");
          await tabViewController.getMovieTabList(limit: '10', order: 'desc', page: '1', genreSlug: genres.slug ?? "", sectionType: 'see_all');
        }
      } else {
        log("No Movie Data Found!");
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabViewController>(builder: (tabViewController){
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sizedBoxH(70),

            /// ==# All Movie
            const HomeSectionAllMovieWidget(),

            ListView.builder(
                itemCount: tabViewController.genresMovieListModel?.data?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index){
                  final genresData = tabViewController.genresMovieListModel?.data?[index];

                  return MovieThrillerWidget(genresListData: genresData);
                }
            ),

            sizedBoxH(100),
          ],
        ),
      );
    });
  }
}

// switch (genres.value.slug) {
//   case "thriller":
//     tabViewController.getMovieThriller(limit: '10', order: 'desc', page: '1', genreSlug: genres.value.slug ?? "", sectionType: genres.value.slug ?? "");
//     break;
//   case "action":
//     tabViewController.getMovieAction(limit: '10', order: 'desc', page: '1', genreSlug: genres.value.slug ?? "", sectionType: genres.value.slug ?? "");
//     break;
//   case "sci-fi":
//     tabViewController.getMovieSiFi(limit: '10', order: 'desc', page: '1', genreSlug: genres.value.slug ?? "", sectionType: genres.value.slug ?? "");
//     break;
//   default:
//     log("Unknown section type: ${genres.value.slug}");
//     break;
// }
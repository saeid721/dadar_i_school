
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../home/view/widget/home_section_widget/home_section_all_series_widget.dart';
import '../controller/tab_view_controller.dart';
import 'widget/series_thriller_widget.dart';

class SeriesTabViewScreen extends StatefulWidget {
  const SeriesTabViewScreen({super.key});

  @override
  State<SeriesTabViewScreen> createState() => _SeriesTabViewScreenState();
}

class _SeriesTabViewScreenState extends State<SeriesTabViewScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tabViewController = TabViewController.current;

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await tabViewController.getGenresList(type: 'series');

      if (tabViewController.genresSeriesListModel != null && tabViewController.genresSeriesListModel!.data!.isNotEmpty) {
        for(var genres in tabViewController.genresSeriesListModel!.data!){
          log("Section Data Slug: ${genres.slug}");
          await tabViewController.getSeriesTabList(limit: '10', order: 'desc', page: '1', genreSlug: genres.slug ?? "", sectionType: 'see_all');
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

            // /// ==# All Movie
            const HomeSectionAllSeriesWidget(),

            ListView.builder(
                itemCount: tabViewController.genresSeriesListModel?.data?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index){
                  final genresData = tabViewController.genresSeriesListModel?.data?[index];

                  return SeriesThrillerWidget(genresListData: genresData);
                }
            ),

            sizedBoxH(100),
          ],
        ),
      );
    });
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../../initializer.dart';
import '../../../../service/language_check/language_check.dart';
import '../../../home/view/widget/home_section_widget/hundred_days_basic_english_course_see_all_widget.dart';
import '../../controller/tab_view_controller.dart';
import '../../model/genres_model.dart';

class MovieTrailerSeeAllScreen extends StatefulWidget {
  final GenresListData? genresListData;
  const MovieTrailerSeeAllScreen({
    super.key,
    this.genresListData
  });
  @override
  State<MovieTrailerSeeAllScreen> createState() => _MovieTrailerSeeAllScreenState();
}

class _MovieTrailerSeeAllScreenState extends State<MovieTrailerSeeAllScreen> {

  final ScrollController scrollController = ScrollController();
  int currentPage = 1;
  int pageSize = 20;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final tabViewController = TabViewController.current;
    scrollController.addListener(scrollListener);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      tabViewController.getMovieTabList(limit: '$pageSize', page: '$currentPage', order: 'desc', genreSlug: widget.genresListData?.slug ?? "");
    });

  }

  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      setState(() {
        currentPage++;
        pageSize = 2 * currentPage;
      });
      TabViewController.current.getMovieTabList(limit: '$pageSize', page: '1', order: 'desc', genreSlug: widget.genresListData?.slug ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabViewController>(builder: (tabViewController){
      final thrillerData = tabViewController.movieTabListDataByGenreSeeAll[widget.genresListData?.slug ?? ""];

      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalAppbarWidget(
                title: LanguageCheck.checkLanguage(
                  langCode: langCode,
                  enText: widget.genresListData?.name ?? "",
                  bnText: widget.genresListData?.nameBn ?? "",
                  hiText: widget.genresListData?.nameHi ?? "",
                  arText: widget.genresListData?.nameAr ?? "",
                ),
              ),

              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: thrillerData?.data?.result?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: size(context).height < 700 ? 1.1 : 1.4,
                  ),
                  itemBuilder: (ctx, index) {
                    final movie = thrillerData?.data?.result?[index];
                    return HundredDaysBasicEnglishCourseSeeAllMenuWidget(
                      thumbnail: movie?.thumbnail ?? '',
                      title: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: movie?.title ?? "",
                        bnText: movie?.titleBn ?? "",
                        hiText: movie?.titleHi ?? "",
                        arText: movie?.titleAr ?? "",
                      ),
                      onTap: () {},
                    );
                  },
                ),
              )

            ],
          ),
        ),
      );
    });
  }
}

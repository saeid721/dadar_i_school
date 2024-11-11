
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
import '../../../home/view/widget/home_section_widget/home_section_see_all_menu_widget.dart';
import '../../controller/tab_view_controller.dart';

class FreeTabListSeeAllSeeAllScreen extends StatefulWidget {
  final String contentType;
  const FreeTabListSeeAllSeeAllScreen({
    super.key,
    required this.contentType
  });
  @override
  State<FreeTabListSeeAllSeeAllScreen> createState() => _FreeTabListSeeAllSeeAllScreenState();
}

class _FreeTabListSeeAllSeeAllScreenState extends State<FreeTabListSeeAllSeeAllScreen> {

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
      tabViewController.getFreeTabViewSeeAll(limit: '$pageSize', page: '1', order: 'desc', content: widget.contentType);
    });

  }

  void scrollListener(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      setState(() {
        currentPage++;
        pageSize = 2 * currentPage;
      });
      TabViewController.current.getFreeTabViewSeeAll(limit: '$pageSize', page: '1', order: 'desc', content: widget.contentType);
    }
  }

  String getAppBarTitle() {
    switch (widget.contentType) {
      case 'movie':
        return 'Free Movies';
      case 'series':
        return 'Free Series';
      case 'season':
        return 'Free Seasons';
      case 'episode':
        return 'Free Episodes';
      default:
        return 'Free Content';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabViewController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalAppbarWidget(
                title: getAppBarTitle(),
              ),

              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  itemCount: homePageController.freeTabViewSeeAllModel?.data?.result?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: size(context).height < 700 ? 1.1 : 1.4,
                  ),
                  itemBuilder: (ctx, index) {
                    final homePageRecentData = homePageController.freeTabViewSeeAllModel?.data?.result?[index];
                    return HomeSectionSeeAllMenuWidget(
                      img: homePageRecentData?.thumbnail ?? '',
                      text: LanguageCheck.checkLanguage(
                        langCode: langCode,
                        enText: homePageRecentData?.title ?? "",
                        bnText: homePageRecentData?.titleBn ?? "",
                        hiText: homePageRecentData?.titleHi ?? "",
                        arText: homePageRecentData?.titleAr ?? "",
                      ),
                      subText: "Free",
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

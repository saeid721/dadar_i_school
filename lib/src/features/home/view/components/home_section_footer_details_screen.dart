import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../initializer.dart';
import '../../../../service/language_check/language_check.dart';
import '../../controller/home_controller.dart';
import '../../model/footer_model/footer_company_model.dart';
import '../../model/footer_model/footer_explore_model.dart';
import '../../model/footer_model/footer_popular_movies_model.dart';
import '../../model/footer_model/footer_popular_series_model.dart';

class HomeSectionFooterDetailsScreen extends StatefulWidget {
  final FooterCompanyData footerCompanyData;
  const HomeSectionFooterDetailsScreen({
    super.key,
    required this.footerCompanyData
  });

  @override
  State<HomeSectionFooterDetailsScreen> createState() => _HomeSectionFooterDetailsScreenState();
}

class _HomeSectionFooterDetailsScreenState extends State<HomeSectionFooterDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            children: [
              const GlobalAppbarWidget(
                title: "Company",
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalImageLoader(
                            imagePath: widget.footerCompanyData.cover ?? "",
                            height: 200,
                            width: size(context).width,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),

                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.pageTitle ?? "",
                                    bnText: widget.footerCompanyData.pageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.pageTitleHi ?? "",
                                    arText: widget.footerCompanyData.pageTitleAr ?? "",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.subPageTitle ?? "",
                                    bnText: widget.footerCompanyData.subPageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.subPageTitleHi ?? "",
                                    arText: widget.footerCompanyData.subPageTitleAr ?? "",
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),


                                sizedBoxH(10),
                                SizedBox(
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: widget.footerCompanyData.description ?? "",
                                      bnText: widget.footerCompanyData.descriptionBn ?? "",
                                      hiText: widget.footerCompanyData.descriptionHi ?? "",
                                      arText: widget.footerCompanyData.descriptionAr ?? "",
                                    ),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


class HomeSectionFooterMovieDetailsScreen extends StatefulWidget {
  final FooterPopularMoviesData footerCompanyData;
  const HomeSectionFooterMovieDetailsScreen({
    super.key,
    required this.footerCompanyData
  });

  @override
  State<HomeSectionFooterMovieDetailsScreen> createState() => _HomeSectionFooterMovieDetailsScreenState();
}

class _HomeSectionFooterMovieDetailsScreenState extends State<HomeSectionFooterMovieDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            children: [
              const GlobalAppbarWidget(
                title: "Company",
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalImageLoader(
                            imagePath: widget.footerCompanyData.cover ?? "",
                            height: 200,
                            width: size(context).width,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),

                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.pageTitle ?? "",
                                    bnText: widget.footerCompanyData.pageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.pageTitleHi ?? "",
                                    arText: widget.footerCompanyData.pageTitleAr ?? "",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.subPageTitle ?? "",
                                    bnText: widget.footerCompanyData.subPageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.subPageTitleHi ?? "",
                                    arText: widget.footerCompanyData.subPageTitleAr ?? "",
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),


                                sizedBoxH(10),
                                SizedBox(
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: widget.footerCompanyData.description ?? "",
                                      bnText: widget.footerCompanyData.descriptionBn ?? "",
                                      hiText: widget.footerCompanyData.descriptionHi ?? "",
                                      arText: widget.footerCompanyData.descriptionAr ?? "",
                                    ),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


class HomeSectionFooterSeriesDetailsScreen extends StatefulWidget {
  final FooterPopularSeriesData footerCompanyData;
  const HomeSectionFooterSeriesDetailsScreen({
    super.key,
    required this.footerCompanyData
  });

  @override
  State<HomeSectionFooterSeriesDetailsScreen> createState() => _HomeSectionFooterSeriesDetailsScreenState();
}

class _HomeSectionFooterSeriesDetailsScreenState extends State<HomeSectionFooterSeriesDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            children: [
              const GlobalAppbarWidget(
                title: "Company",
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalImageLoader(
                            imagePath: widget.footerCompanyData.cover ?? "",
                            height: 200,
                            width: size(context).width,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),

                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.pageTitle ?? "",
                                    bnText: widget.footerCompanyData.pageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.pageTitleHi ?? "",
                                    arText: widget.footerCompanyData.pageTitleAr ?? "",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.subPageTitle ?? "",
                                    bnText: widget.footerCompanyData.subPageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.subPageTitleHi ?? "",
                                    arText: widget.footerCompanyData.subPageTitleAr ?? "",
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),


                                sizedBoxH(10),
                                SizedBox(
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: widget.footerCompanyData.description ?? "",
                                      bnText: widget.footerCompanyData.descriptionBn ?? "",
                                      hiText: widget.footerCompanyData.descriptionHi ?? "",
                                      arText: widget.footerCompanyData.descriptionAr ?? "",
                                    ),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}


class HomeSectionFooterExploreDetailsScreen extends StatefulWidget {
  final FooterExploreData footerCompanyData;
  const HomeSectionFooterExploreDetailsScreen({
    super.key,
    required this.footerCompanyData
  });

  @override
  State<HomeSectionFooterExploreDetailsScreen> createState() => _HomeSectionFooterExploreDetailsScreenState();
}

class _HomeSectionFooterExploreDetailsScreenState extends State<HomeSectionFooterExploreDetailsScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appNavyColor,
          child: Column(
            children: [
              const GlobalAppbarWidget(
                title: "Company",
              ),

              NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll){
                  overScroll.disallowIndicator();
                  return true;
                },
                child: Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalImageLoader(
                            imagePath: widget.footerCompanyData.cover ?? "",
                            height: 200,
                            width: size(context).width,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),

                          sizedBoxH(10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.pageTitle ?? "",
                                    bnText: widget.footerCompanyData.pageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.pageTitleHi ?? "",
                                    arText: widget.footerCompanyData.pageTitleAr ?? "",
                                  ),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),

                                GlobalText(
                                  str: LanguageCheck.checkLanguage(
                                    langCode: langCode,
                                    enText: widget.footerCompanyData.subPageTitle ?? "",
                                    bnText: widget.footerCompanyData.subPageTitleBn ?? "",
                                    hiText: widget.footerCompanyData.subPageTitleHi ?? "",
                                    arText: widget.footerCompanyData.subPageTitleAr ?? "",
                                  ),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),


                                sizedBoxH(10),
                                SizedBox(
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: widget.footerCompanyData.description ?? "",
                                      bnText: widget.footerCompanyData.descriptionBn ?? "",
                                      hiText: widget.footerCompanyData.descriptionHi ?? "",
                                      arText: widget.footerCompanyData.descriptionAr ?? "",
                                    ),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

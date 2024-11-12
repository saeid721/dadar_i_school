
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../domain/local/preferences/local_storage.dart';
import '../../domain/local/preferences/local_storage_keys.dart';
import '../../global/constants/colors_resources.dart';
import '../../global/constants/images.dart';
import '../../global/utils/show_toast.dart';
import '../../global/widget/global_sized_box.dart';
import '../../global/widget/global_text.dart';
import '../../initializer.dart';
import '../../service/language_check/language_check.dart';
import '../home/controller/home_controller.dart';
import '../home/view/components/home_section_footer_details_screen.dart';
import '../home/view/widget/social_menu_widget.dart';

class FooterViewScreen extends StatefulWidget {
  const FooterViewScreen({super.key});

  @override
  State<FooterViewScreen> createState() => _FooterViewScreenState();
}

class _FooterViewScreenState extends State<FooterViewScreen> {

  bool isExploreClick = false;
  bool isSeriesClick = false;
  bool isMovieClick = false;
  bool isCompanyClick = false;

  Future<void>? launched;
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController){
      final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);

      return Container(
        width: size(context).width,
        color: ColorRes.appColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxH(10),
            const GlobalImageText(
              str: "NP",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),

            sizedBoxH(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMenuWidget(
                  img: Images.facebookIc,
                  onTap: (){},
                ),

                sizedBoxW(10),
                SocialMenuWidget(
                  img: Images.instagramIc,
                  onTap: (){},
                ),

                sizedBoxW(10),
                SocialMenuWidget(
                  img: Images.linkedInIc,
                  onTap: (){},
                ),
              ],
            ),

            sizedBoxH(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMenuWidget(
                  img: Images.youtubeIc,
                  onTap: (){},
                ),

                sizedBoxW(10),
                SocialMenuWidget(
                  img: Images.twitterIc,
                  onTap: (){},
                ),
              ],
            ),

            sizedBoxH(30),
            homePageController.footerExploreModel?.data?.isNotEmpty ?? false
                ? Container(
              width: size(context).width,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: ColorRes.white),
                  borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        isExploreClick = !isExploreClick;
                      });
                    },
                    child: const SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: GlobalText(
                              str: "Explore",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: ColorRes.white,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ),

                  isExploreClick == true ?
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: homePageController.footerExploreModel?.data?.asMap().entries.map((item){
                          return GestureDetector(
                            onTap: () {
                              if(item.value.footerUrlType == "custom"){
                                final Uri toLaunch = Uri.parse(item.value.customUrl ?? '');
                                if (toLaunch.scheme.isEmpty) {
                                  showCustomSnackBar('Invalid URL', icon: Icons.error);
                                } else {
                                  setState(() {
                                    launched = _launchInBrowser(toLaunch);
                                  });
                                }
                              } else if(item.value.footerUrlType == "general"){
                                Get.to(()=> HomeSectionFooterExploreDetailsScreen(
                                  footerCompanyData: item.value,
                                ));
                              } else{

                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              color: Colors.transparent,
                              child: GlobalText(
                                str: LanguageCheck.checkLanguage(
                                  langCode: langCode,
                                  enText: item.value.pageTitle ?? "",
                                  bnText: item.value.pageTitleBn ?? "",
                                  hiText: item.value.pageTitleHi ?? "",
                                  arText: item.value.pageTitleAr ?? "",
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          );
                        }).toList() ?? []
                    ),
                  ) : const SizedBox.shrink()
                ],
              ),
            ) : const SizedBox.shrink(),

            homePageController.footerPopularSeriesModel?.data?.isNotEmpty ?? false
                ? Column(
              children: [
                sizedBoxH(10),
                Container(
                  width: size(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorRes.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isSeriesClick = !isSeriesClick;
                          });
                        },
                        child: const SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: GlobalText(
                                  str: "Popular Series",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: ColorRes.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),

                      isSeriesClick == true ?
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homePageController.footerPopularSeriesModel?.data?.asMap().entries.map((series){
                              return GestureDetector(
                                onTap: () {
                                  if(series.value.footerUrlType == "custom"){
                                    final Uri toLaunch = Uri.parse(series.value.customUrl ?? '');
                                    if (toLaunch.scheme.isEmpty) {
                                      showCustomSnackBar('Invalid URL', icon: Icons.error);
                                    } else {
                                      setState(() {
                                        launched = _launchInBrowser(toLaunch);
                                      });
                                    }
                                  } else if(series.value.footerUrlType == "general"){
                                    Get.to(()=> HomeSectionFooterSeriesDetailsScreen(
                                      footerCompanyData: series.value,
                                    ));
                                  } else{

                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  color: Colors.transparent,
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: series.value.pageTitle ?? "",
                                      bnText: series.value.pageTitleBn ?? "",
                                      hiText: series.value.pageTitleHi ?? "",
                                      arText: series.value.pageTitleAr ?? "",
                                    ),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              );
                            }).toList() ?? []
                        ),
                      ) : const SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            )
                : const SizedBox.shrink(),


            homePageController.footerPopularMoviesModel?.data?.isNotEmpty ?? false
                ? Column(
              children: [
                sizedBoxH(10),
                Container(
                  width: size(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorRes.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isMovieClick = !isMovieClick;
                          });
                        },
                        child: const SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: GlobalText(
                                  str: "Popular Movie",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: ColorRes.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),

                      isMovieClick == true ?
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homePageController.footerPopularMoviesModel?.data?.asMap().entries.map((movie){
                              return GestureDetector(
                                onTap: () {
                                  if(movie.value.footerUrlType == "custom"){
                                    final Uri toLaunch = Uri.parse(movie.value.customUrl ?? '');
                                    if (toLaunch.scheme.isEmpty) {
                                      showCustomSnackBar('Invalid URL', icon: Icons.error);
                                    } else {
                                      setState(() {
                                        launched = _launchInBrowser(toLaunch);
                                      });
                                    }
                                  } else if(movie.value.footerUrlType == "general"){
                                    Get.to(()=> HomeSectionFooterMovieDetailsScreen(
                                      footerCompanyData: movie.value,
                                    ));
                                  } else{

                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  color: Colors.transparent,
                                  child: GlobalText(
                                    str: LanguageCheck.checkLanguage(
                                      langCode: langCode,
                                      enText: movie.value.pageTitle ?? "",
                                      bnText: movie.value.pageTitleBn ?? "",
                                      hiText: movie.value.pageTitleHi ?? "",
                                      arText: movie.value.pageTitleAr ?? "",
                                    ),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              );
                            }).toList() ?? []
                        ),
                      ) : const SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            )
                : const SizedBox.shrink(),

            homePageController.footerCompanyModel?.data?.isNotEmpty ?? false
                ? Column(
              children: [
                sizedBoxH(10),
                Container(
                  width: size(context).width,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorRes.white),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isCompanyClick = !isCompanyClick;
                          });
                        },
                        child: const SizedBox(
                          child: Row(
                            children: [
                              Expanded(
                                child: GlobalText(
                                  str: "Company",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_drop_down_outlined,
                                color: ColorRes.white,
                                size: 18,
                              )
                            ],
                          ),
                        ),
                      ),

                      isCompanyClick == true ?
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 8),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homePageController.footerCompanyModel?.data?.asMap().entries.map((item){
                              return GestureDetector(
                                  onTap: () {
                                    if(item.value.footerUrlType == "custom"){
                                      final Uri toLaunch = Uri.parse(item.value.customUrl ?? '');
                                      if (toLaunch.scheme.isEmpty) {
                                        showCustomSnackBar('Invalid URL', icon: Icons.error);
                                      } else {
                                        setState(() {
                                          launched = _launchInBrowser(toLaunch);
                                        });
                                      }
                                    } else if(item.value.footerUrlType == "general"){
                                      Get.to(()=> HomeSectionFooterDetailsScreen(
                                        footerCompanyData: item.value,
                                      ));
                                    } else{

                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    color: Colors.transparent,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 5),
                                      child: GlobalText(
                                        str: LanguageCheck.checkLanguage(
                                          langCode: langCode,
                                          enText: item.value.pageTitle ?? "",
                                          bnText: item.value.pageTitleBn ?? "",
                                          hiText: item.value.pageTitleHi ?? "",
                                          arText: item.value.pageTitleAr ?? "",
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ));
                            }).toList() ?? []
                        ),
                      ) : const SizedBox.shrink()
                    ],
                  ),
                ),
              ],
            )
                : const SizedBox.shrink(),

            sizedBoxH(20),
            const GlobalText(
              str: "Copyright © 2024 NP",
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),

            sizedBoxH(110),
          ],
        ),
      );
    });
  }
}

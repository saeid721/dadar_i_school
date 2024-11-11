
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/domain/server/http_client/app_config.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/constants/images.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/global/widget/global_text.dart';
import '../../../domain/local/preferences/local_storage.dart';
import '../../../domain/local/preferences/local_storage_keys.dart';
import '../../../global/widget/global_textform_field.dart';
import '../../../initializer.dart';
import '../../../service/language_check/language_check.dart';
import '../controller/search_bar_controller.dart';
import 'widget/search_menu_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key,});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final searchBarController = SearchBarController.current;
    searchBarController.getSearchPopular(limit: '30');

  }

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<SearchBarController>(builder: (searchBarController){
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxH(40),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: GlobalText(
                  str: "Search",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              sizedBoxH(10),
              GlobalTextFormField(
                controller: emailCon,
                hintText: "Search Movie & Series",
                filled: true,
                fillColor: ColorRes.bottomColor,
                isDense: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: GlobalImageLoader(
                    imagePath: Images.searchIc,
                    color: ColorRes.white200,
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                  ),
                ),
                sufixIcon: emailCon.text.isNotEmpty ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        emailCon.clear();
                      });
                    },
                    child: const GlobalImageLoader(
                      imagePath: Images.close,
                      color: ColorRes.white200,
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ) : const SizedBox.shrink(),
                onChanged: (val){
                  setState(() {
                    emailCon.text = val;
                  });
                },
              ),

              sizedBoxH(10),
              Expanded(
                child: ListView.builder(
                  itemCount: searchBarController.searchPopularModel?.data?.length ?? 0,
                  padding: const EdgeInsets.only(bottom: 100),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final popularSearchData = searchBarController.searchPopularModel?.data?[index];
                    log("Search Img Url: ${AppConfig.base.url}${popularSearchData?.thumbnail}");
                    return SearchMenuWidget(
                      img: "${popularSearchData?.thumbnail}",
                      text: LanguageCheck.checkLanguage(
                          langCode: langCode,
                          enText: popularSearchData?.title ?? "",
                          bnText: popularSearchData?.titleBn ?? "",
                          hiText: popularSearchData?.titleHi ?? "",
                          arText: popularSearchData?.titleAr ?? ""
                      ),
                      timeText: popularSearchData?.duration ?? "",
                      viewText: popularSearchData?.views.toString() ?? "",
                      onTap: (){}
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

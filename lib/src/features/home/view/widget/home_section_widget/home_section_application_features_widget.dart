
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../domain/local/preferences/local_storage.dart';
import '../../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../../global/constants/colors_resources.dart';
import '../../../../../global/constants/enum.dart';
import '../../../../../global/widget/global_image_loader.dart';
import '../../../../../global/widget/global_sized_box.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../initializer.dart';
import '../../../../../service/language_check/language_check.dart';
import '../../../controller/home_controller.dart';

class HomeSectionApplicationFeaturesWidget extends StatefulWidget {
  const HomeSectionApplicationFeaturesWidget({
    super.key,
  });

  @override
  State<HomeSectionApplicationFeaturesWidget> createState() => _HomeSectionApplicationFeaturesWidgetState();
}

class _HomeSectionApplicationFeaturesWidgetState extends State<HomeSectionApplicationFeaturesWidget> {

  @override
  Widget build(BuildContext context) {
    final langCode = locator<LocalStorage>().getString(key: StorageKeys.langCode);
    return GetBuilder<HomePageController>(builder: (homePageController){
      return  homePageController.homeSectionApplicationFeaturesModel?.data?.isNotEmpty ?? false ? Container(
        width: size(context).width,
        color: ColorRes.black,
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            sizedBoxH(20),
            const GlobalText(
              str: "OTT Is Offers Superior Live TV Streaming",
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            sizedBoxH(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: homePageController.homeSectionApplicationFeaturesModel?.data?.asMap().entries.map((features){
                    return Container(
                      width: 115,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: ColorRes.appNavyColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GlobalImageLoader(
                            imagePath: "${features.value.icon}",
                            height: 60,
                            width: 60,
                            imageFor: ImageFor.network,
                            fit: BoxFit.fill,
                          ),
                          sizedBoxH(30),
                          GlobalText(
                            str: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: features.value.title ?? "",
                              bnText: features.value.titleBn ?? "",
                              hiText: features.value.titleHi ?? "",
                              arText: features.value.titleAr ?? "",
                            ),
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),

                          sizedBoxH(10),
                          GlobalText(
                            str: LanguageCheck.checkLanguage(
                              langCode: langCode,
                              enText: features.value.shortDescription ?? "",
                              bnText: features.value.shortDescriptionBn ?? "",
                              hiText: features.value.shortDescriptionHi ?? "",
                              arText: features.value.shortDescriptionAr ?? "",
                            ),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }).toList() ?? []
              ),
            ),
            sizedBoxH(20),
          ],
        ),
      ) : const SizedBox.shrink();
    });
  }
}

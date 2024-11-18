import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../video_details/view/hundred_days_basic_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/hundred_days_basic_english_see_all_widget.dart';

class SpokenEnglishPracticeSeeAllScreen extends StatefulWidget {

  const SpokenEnglishPracticeSeeAllScreen({
    super.key,
  });

  @override
  State<SpokenEnglishPracticeSeeAllScreen> createState() => _SpokenEnglishPracticeSeeAllScreenState();
}

class _SpokenEnglishPracticeSeeAllScreenState extends State<SpokenEnglishPracticeSeeAllScreen> {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (homePageController) {
      return Scaffold(
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalAppbarWidget(
                title: "Spoken English Practice",
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: homePageController.spokenEnglishPracticeModel?.spokenEnglishPracticeList?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.04,
                  ),
                  itemBuilder: (ctx, index) {
                    final courseData = homePageController.spokenEnglishPracticeModel?.spokenEnglishPracticeList?[index];
                    return HundredDaysBasicEnglishSeeAllMenuWidget(
                      thumbnail: courseData?.thumbnail ?? "",
                      title: courseData?.title ?? "",
                      onTap: () {
                        Get.to(() => HundredDaysBasicEnglishVideoDetailsScreen(
                          id: courseData?.id.toString() ?? "",
                          title: courseData?.title ?? "",
                          shortDescription: courseData?.shortDescription ?? "",
                          thumbnail: courseData?.thumbnail ?? "",
                          youtubeLink: courseData?.youtubeLink ?? "",
                        ));
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

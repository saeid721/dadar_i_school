import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../video_details/view/hundred_days_basic_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/see_all_widget.dart';

class HundredDaysBasicEnglishSeeAllVerticaleScreen extends StatefulWidget {

  const HundredDaysBasicEnglishSeeAllVerticaleScreen({
    super.key,
  });

  @override
  State<HundredDaysBasicEnglishSeeAllVerticaleScreen> createState() => _HundredDaysBasicEnglishSeeAllVerticaleScreenState();
}

class _HundredDaysBasicEnglishSeeAllVerticaleScreenState extends State<HundredDaysBasicEnglishSeeAllVerticaleScreen> {


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
                title: "100 Days Basic English Course",
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.04,
                  ),
                  itemBuilder: (ctx, index) {
                    final courseData = homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?[index];
                    return SeeAllMenuWidget(
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

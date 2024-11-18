import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_appbar.dart';
import '../../../../global/widget/global_container.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../video_details/view/beginner_spoken_english_video_details_screen.dart';
import '../../controller/home_controller.dart';
import '../widget/beginner_spoken_english_see_all_widget.dart';

class BeginnerSpokenEnglishSeeAllScreen extends StatefulWidget {

  const BeginnerSpokenEnglishSeeAllScreen({
    super.key,
  });

  @override
  State<BeginnerSpokenEnglishSeeAllScreen> createState() => _BeginnerSpokenEnglishSeeAllScreenState();
}

class _BeginnerSpokenEnglishSeeAllScreenState extends State<BeginnerSpokenEnglishSeeAllScreen> {


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
                title: "Beginner Spoken English Course",
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: homePageController.beginnerSpokenEnglishModel?.beginnerSpokenEnglishList?.length,
                  padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (ctx, index) {
                    final courseData = homePageController.beginnerSpokenEnglishModel?.beginnerSpokenEnglishList?[index];
                    return BeginnerSpokenEnglishSeeAllMenuWidget(
                      thumbnail: courseData?.thumbnail ?? "",
                      title: courseData?.title ?? "",
                      onTap: () {
                        Get.to(() => BeginnerSpokenEnglishVideoDetailsScreen(
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

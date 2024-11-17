import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../home/controller/home_controller.dart';
import '../../home/view/widget/see_all_vertical_widget.dart';
import '../controller/video_controller.dart';

class HundredDaysBasicEnglishVideoDetailsScreen extends StatefulWidget {
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;

  const HundredDaysBasicEnglishVideoDetailsScreen({
    super.key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
  });

  @override
  State<HundredDaysBasicEnglishVideoDetailsScreen> createState() => _HundredDaysBasicEnglishVideoDetailsScreenState();
}

class _HundredDaysBasicEnglishVideoDetailsScreenState extends State<HundredDaysBasicEnglishVideoDetailsScreen> {
  final VideoController videoController = Get.put(VideoController());

  @override
  void initState() {
    super.initState();

    if (widget.youtubeLink.contains('youtube.com') || widget.youtubeLink.contains('youtu.be')) {
      videoController.initializeYoutubeController(widget.youtubeLink);
    } else {
      videoController.initializeVideoPlayerController(widget.youtubeLink);
    }

    // Lock the orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        builder: (homePageController) {
          return GlobalContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorRes.appNavyColor,
            child: SingleChildScrollView(
              // Scrollable widget to handle overflow
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedBoxH(27),
                  videoController.buildYoutubePlayer(),
                  sizedBoxH(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          str: widget.title,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        sizedBoxH(5),
                        ExpandableDescription(
                          description: widget.shortDescription,
                        ),
                        sizedBoxH(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GlobalText(
                            str: "Beginner Spoken English Course",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList != null
                            ? ListView.builder(
                          shrinkWrap: true, // Prevents infinite height error
                          physics: const NeverScrollableScrollPhysics(), // Avoids nested scroll conflicts
                          itemCount: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.length ?? 0,
                          itemBuilder: (ctx, index) {
                            final courseData = homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?[index];
                            return SeeAllMenuVerticalWidget(
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
                        )
                            : Center(
                          child: GlobalText(
                            str: "No data available",
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}

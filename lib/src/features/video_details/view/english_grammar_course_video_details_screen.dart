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

class EnglishGrammarCourseVideoDetailsScreen extends StatefulWidget {
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;

  const EnglishGrammarCourseVideoDetailsScreen({
    super.key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
  });

  @override
  State<EnglishGrammarCourseVideoDetailsScreen> createState() => _EnglishGrammarCourseVideoDetailsScreenState();
}

class _EnglishGrammarCourseVideoDetailsScreenState extends State<EnglishGrammarCourseVideoDetailsScreen> {
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
            color: ColorRes.appBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sizedBoxH(30),
                videoController.buildYoutubePlayer(), // Video player remains fixed
                sizedBoxH(10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GlobalText(
                        str: widget.title,
                        fontSize: 16,
                        color: ColorRes.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                      sizedBoxH(5),
                      ExpandableDescription(
                        description: widget.shortDescription,
                      ),
                      sizedBoxH(20),
                      GlobalText(
                        str: "English Grammar Course",
                        fontSize: 16,
                        color: ColorRes.appCeruleanColor ,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: GlobalContainer(
                        color: ColorRes.appBackgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homePageController.englishGrammarCourseModel?.englishGrammarCourseList != null
                                ? ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true, // Prevents infinite height error
                                    physics: const NeverScrollableScrollPhysics(), // Avoids nested scroll conflicts
                                    itemCount: homePageController.englishGrammarCourseModel?.englishGrammarCourseList?.length ?? 0,
                                    itemBuilder: (ctx, index) {
                                      final courseData = homePageController.englishGrammarCourseModel?.englishGrammarCourseList?[index];
                                      return SeeAllMenuVerticalWidget(
                                        thumbnail: courseData?.thumbnail ?? "",
                                        title: courseData?.title ?? "",
                                        shortDescription: courseData?.shortDescription ?? "",
                                        onTap: () {
                                          videoController.currentVideoIndex = index;
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
                    ),
                  ),
                ),
              ],
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

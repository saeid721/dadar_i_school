import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../global/constants/colors_resources.dart';
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
  State<HundredDaysBasicEnglishVideoDetailsScreen> createState() =>
      _HundredDaysBasicEnglishVideoDetailsScreenState();
}

class _HundredDaysBasicEnglishVideoDetailsScreenState
    extends State<HundredDaysBasicEnglishVideoDetailsScreen>
    with SingleTickerProviderStateMixin {

  final VideoController videoController = Get.put(VideoController());
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.youtubeLink.contains('youtube.com') ||
        widget.youtubeLink.contains('youtu.be')) {
      videoController.initializeYoutubeController(widget.youtubeLink);
    } else {
      videoController.initializeVideoPlayerController(widget.youtubeLink);
    }

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appBackgroundColor,
      body: GetBuilder<HomePageController>(
        builder: (homePageController) {
          return SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        offset: const Offset(0, 2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ColorRes.appColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: ColorRes.appColor,
                            size: 18,
                          ),
                        ),
                      ),
                      sizedBoxW(12),
                      Expanded(
                        child: GlobalText(
                          str: "Course Details",
                          fontSize: 18,
                          color: ColorRes.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorRes.appColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.bookmark_outline,
                          color: ColorRes.appColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),

                // Video Player Section
                Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: videoController.buildYoutubePlayer(),
                  ),
                ),

                // Content Section
                Expanded(
                  child: _buildContentSection(homePageController),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentSection(HomePageController homePageController) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: widget.title,
                    fontSize: 16,
                    color: ColorRes.appColor,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  sizedBoxH(8),
                  GlobalText(
                    str: widget.shortDescription,
                    fontSize: 12,
                    color: ColorRes.deep300,
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              color: Colors.grey.withValues(alpha: 0.2),
            ),

            sizedBoxH(16),

            // Course List
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList != null
                    ? Column(
                  children: [
                    ...List.generate(
                      homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?.length ?? 0,
                          (index) {
                        final courseData = homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList?[index];
                        return SeeAllMenuVerticalWidget(
                          thumbnail: courseData?.thumbnail ?? "",
                          title: courseData?.title ?? "",
                          shortDescription: courseData?.shortDescription ?? "",
                          isSelected: videoController.currentVideoIndex == index,
                          duration: "5:30",
                          isCompleted: index < 3,
                          onTap: () {
                            setState(() {
                              videoController.currentVideoIndex = index;
                            });
                            HapticFeedback.lightImpact();
                          },
                        );
                      },
                    ),
                    sizedBoxH(20),
                  ],
                )
                    : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_library_outlined,
                        size: 64,
                        color: Colors.grey.withValues(alpha: 0.5),
                      ),
                      sizedBoxH(16),
                      GlobalText(
                        str: "No videos available",
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    videoController.dispose();
    super.dispose();
  }
}
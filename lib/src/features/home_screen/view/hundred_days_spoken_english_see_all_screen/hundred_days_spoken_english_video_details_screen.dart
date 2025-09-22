import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../controller/home_controller.dart';
import '../../controller/video_controller.dart';
import '../widget/see_all_vertical_widget.dart';

class HundredDaysSpokenEnglishVideoDetailsScreen extends StatefulWidget {
  const HundredDaysSpokenEnglishVideoDetailsScreen({
    super.key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    this.initialVideoIndex,
  });
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final int? initialVideoIndex;

  @override
  State<HundredDaysSpokenEnglishVideoDetailsScreen> createState() => _HundredDaysSpokenEnglishVideoDetailsScreenState();
}

class _HundredDaysSpokenEnglishVideoDetailsScreenState extends State<HundredDaysSpokenEnglishVideoDetailsScreen> with SingleTickerProviderStateMixin {

  late VideoController videoController;
  final HomePageController homePageController = Get.find<HomePageController>();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String controllerTag = '';

  @override
  void initState() {
    super.initState();
    _initializeComponents();
    _initializeVideoController();
  }

  void _initializeComponents() {
    controllerTag = 'video_${DateTime.now().millisecondsSinceEpoch}';
    videoController = Get.put(VideoController(), tag: controllerTag);

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

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  void _initializeVideoController() {
    final videoList = homePageController.hundredDaysBasicEnglishModel?.hundredDaysBasicEnglishList;

    if (videoList != null && videoList.isNotEmpty) {
      videoController.setInitialVideo(
        videoList,
        videoId: widget.id,
        youtubeLink: widget.youtubeLink,
        index: widget.initialVideoIndex,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(),
            _buildVideoPlayer(),
            _buildVideoControls(),
            Expanded(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: _buildContentSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
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
        ],
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return GetBuilder<VideoController>(
      init: videoController,
      tag: controllerTag,
      builder: (controller) {
        return Container(
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
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: controller.buildVideoPlayer(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVideoControls() {
    return GetBuilder<VideoController>(
      init: videoController,
      tag: controllerTag,
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: controller.hasPreviousVideo
                    ? () {
                  controller.playPrevious();
                  HapticFeedback.lightImpact();
                }
                    : null,
                icon: Icon(
                  Icons.skip_previous,
                  color: controller.hasPreviousVideo
                      ? ColorRes.appColor
                      : Colors.grey,
                  size: 32,
                ),
              ),
              Text(
                controller.playlistPosition,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorRes.appColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: controller.hasNextVideo
                    ? () {
                  controller.playNext();
                  HapticFeedback.lightImpact();
                }
                    : null,
                icon: Icon(
                  Icons.skip_next,
                  color: controller.hasNextVideo
                      ? ColorRes.appColor
                      : Colors.grey,
                  size: 32,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContentSection() {
    return Container(
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
          _buildVideoInfo(),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.grey.withValues(alpha: 0.2),
          ),
          sizedBoxH(16),
          Expanded(child: _buildPlaylist()),
        ],
      ),
    );
  }

  Widget _buildVideoInfo() {
    return GetBuilder<VideoController>(
      init: videoController,
      tag: controllerTag,
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: controller.videoTitle.isNotEmpty
                    ? controller.videoTitle
                    : widget.title,
                fontSize: 16,
                color: ColorRes.appColor,
                fontWeight: FontWeight.w600,
                maxLines: 2,
              ),
              sizedBoxH(8),
              GlobalText(
                str: controller.videoDescription.isNotEmpty
                    ? controller.videoDescription
                    : widget.shortDescription,
                fontSize: 12,
                color: ColorRes.deep300,
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildPlaylist() {
    return GetBuilder<HomePageController>(
      builder: (homeController) {
        final videoList = homeController.hundredDaysSpokenEnglishModel?.hundredDaysSpokenEnglishList;

        if (videoList == null || videoList.isEmpty) {
          return _buildEmptyState();
        }

        return GetBuilder<VideoController>(
          init: videoController,
          tag: controllerTag,
          builder: (controller) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(
                      'Course Videos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: ColorRes.appColor,
                      ),
                    ),
                  ),
                  ...videoList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final courseData = entry.value;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: SeeAllMenuVerticalWidget(
                        thumbnail: courseData.thumbnail ?? "",
                        title: courseData.title ?? "",
                        shortDescription: courseData.shortDescription ?? "",
                        onTap: () {
                          controller.switchToVideo(index);
                          HapticFeedback.lightImpact();
                        },
                      ),
                    );
                  }),
                  sizedBoxH(20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
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
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    if (Get.isRegistered<VideoController>(tag: controllerTag)) {
      Get.delete<VideoController>(tag: controllerTag);
    }

    super.dispose();
  }
}
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../data.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../../download/controller/download_controller.dart';
import '../controller/video_details_controller.dart';
import 'widget/video_player_details_widget.dart';


class HundredDaysBasicEnglishCourseVideoDetailsScreen extends StatefulWidget {
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;

  const HundredDaysBasicEnglishCourseVideoDetailsScreen({
    super.key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
  });

  @override
  State<HundredDaysBasicEnglishCourseVideoDetailsScreen> createState() => _HundredDaysBasicEnglishCourseVideoDetailsScreenState();
}

class _HundredDaysBasicEnglishCourseVideoDetailsScreenState extends State<HundredDaysBasicEnglishCourseVideoDetailsScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Get.put(VideoDetailsController());

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Any post-frame initialization can go here.
    });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Widget _buildSubscriptionMessage(BuildContext context) {
    return Center(
      child: Container(
        height: 210,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: ColorRes.black),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 5,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: ColorRes.grey,
                    size: 18,
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GlobalText(
                  str: "Oops! This video is part of our premium collection. Subscribe now to enjoy it for the duration of your subscription!",
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(builder: (downloadController) {
      return GetBuilder<VideoDetailsController>(builder: (videoDetailsController) {
        final dubbedList = basicEnglishCourseData;

        return Scaffold(
          key: scaffoldKey,
          body: GlobalContainer(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: ColorRes.appBackColor,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sizedBoxH(27),

                    // == Video Player Section ==
                    dubbedList.isNotEmpty
                        ? ListView.builder(
                      itemCount: dubbedList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (ctx, index) {
                        final dubbedVideo = dubbedList[index];
                        return VideoPlayerDetailsWidget(
                          youtubeLink: dubbedVideo.youtubeLink,
                          thumbnail: dubbedVideo.thumbnail,
                          videoText: dubbedVideo.title,
                        );
                      },
                    )
                        : const SizedBox.shrink(),

                    sizedBoxH(10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      str: widget.id,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    sizedBoxH(3),
                                    GlobalText(
                                      str: widget.title,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              sizedBoxW(10),
                              GlobalButtonWidget(
                                str: "Download",
                                height: 30,
                                width: 70,
                                textSize: 11,
                                onTap: () {
                                  log('Download tapped');
                                },
                              ),
                            ],
                          ),
                          sizedBoxH(5),
                          ExpandableDescription(
                            description: widget.shortDescription,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 80),

                    if (downloadController.progress > 0 && downloadController.progress < 100)
                      LinearProgressIndicator(
                        value: downloadController.progress / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),

                    sizedBoxH(20),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}

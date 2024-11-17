import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../controller/video_controller.dart';

class SpokenEnglishPracticeVideoDetailsScreen extends StatefulWidget {
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;

  const SpokenEnglishPracticeVideoDetailsScreen({
    super.key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
  });

  @override
  State<SpokenEnglishPracticeVideoDetailsScreen> createState() =>
      _SpokenEnglishPracticeVideoDetailsScreenState();
}

class _SpokenEnglishPracticeVideoDetailsScreenState
    extends State<SpokenEnglishPracticeVideoDetailsScreen> {
  final VideoController videoController = VideoController();

  @override
  void initState() {
    super.initState();

    if (widget.youtubeLink.contains('youtube.com') ||
        widget.youtubeLink.contains('youtu.be')) {
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
      body: GlobalContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorRes.appNavyColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxH(27),
              videoController.buildYoutubePlayer(),
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
                          buttomColor: ColorRes.appCeruleanColor,
                          textSize: 11,
                          onTap: () => log('Download tapped'),
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }
}

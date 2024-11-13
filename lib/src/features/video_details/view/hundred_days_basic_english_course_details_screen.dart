import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../global/constants/colors_resources.dart';
import '../../../global/widget/global_bottom_widget.dart';
import '../../../global/widget/global_container.dart';
import '../../../global/widget/global_sized_box.dart';
import '../../../global/widget/global_text.dart';
import '../controller/video_controller.dart';

class HundredDaysBasicEnglishCourseVideoDetailsScreen extends StatefulWidget {
  final String id;
  final String youtubeLink;
  final String title;
  final String thumbnail;
  final String shortDescription;

  const HundredDaysBasicEnglishCourseVideoDetailsScreen({
    Key? key,
    required this.id,
    required this.youtubeLink,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
  }) : super(key: key);

  @override
  State<HundredDaysBasicEnglishCourseVideoDetailsScreen> createState() =>
      _HundredDaysBasicEnglishCourseVideoDetailsScreenState();
}

class _HundredDaysBasicEnglishCourseVideoDetailsScreenState
    extends State<HundredDaysBasicEnglishCourseVideoDetailsScreen> {
  final VideoController controller = Get.put(VideoController());
  YoutubePlayerController? youtubePlayerController;

  @override
  void initState() {
    super.initState();

    // Check if the video is a YouTube video
    if (widget.youtubeLink.contains('youtube.com') || widget.youtubeLink.contains('youtu.be')) {
      String? videoId = YoutubePlayer.convertUrlToId(widget.youtubeLink);
      if (videoId != null) {
        youtubePlayerController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
        );
      }
    } else {
      // Initialize Chewie for non-YouTube video playback
      VideoPlayerController videoPlayerController =
      VideoPlayerController.network(widget.youtubeLink);

    }

    // Lock the orientation to portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    youtubePlayerController?.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer() {
    if (youtubePlayerController != null) {
      return YoutubePlayer(controller: youtubePlayerController!);
    } else {
      return _buildSubscriptionMessage();
    }
  }

  Widget _buildSubscriptionMessage() {
    return Center(
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: const BoxDecoration(color: ColorRes.black),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 5,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
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
                child: Text(
                  "Oops! This video is part of our premium collection. Subscribe now to enjoy it!",
                  style: TextStyle(color: Colors.white, fontSize: 12),
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
    return Scaffold(
      body: GlobalContainer(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: ColorRes.appBackColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              sizedBoxH(27),
              _buildVideoPlayer(),
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
                          buttomColor: ColorRes.appRedColor,
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
}



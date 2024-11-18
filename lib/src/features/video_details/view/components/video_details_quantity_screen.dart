import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../controller/video_details_controller.dart';

class VideoDetailsQualityScreen extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoDetailsQualityScreen({
    super.key,
    required this.controller
  });

  @override
  State<VideoDetailsQualityScreen> createState() => _VideoDetailsQualityScreenState();
}

class _VideoDetailsQualityScreenState extends State<VideoDetailsQualityScreen> {

  final videoDetailsController = Get.find<VideoDetailsController>();
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoDetailsController>(builder: (videoPlayerDetailsController){
      return StatefulBuilder(
          builder: (ctx, buildSetState){
            return Container(
              width: size(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: ColorRes.appBackgroundColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  sizedBoxH(10),
                  Container(
                    height: 4,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorRes.grey.withOpacity(0.3)
                    ),
                  ),

                  sizedBoxH(10),
                  Row(
                    children: [
                      GlobalText(
                        str: "Quality For Current Video ${videoPlayerController.value.size.height.toInt()}p",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),

                  sizedBoxH(10),

                  Expanded(
                    child: ListView.builder(
                        itemCount: videoPlayerDetailsController.qualityList.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index){
                          final quantityData = videoPlayerDetailsController.qualityList[index];
                          log("Video Qty: ${quantityData.resolution}");
                          return GestureDetector(
                            onTap: () {
                              buildSetState(() {
                                try{
                                  videoPlayerDetailsController.selectQuantity = index;
                                  final selectedQuality = videoPlayerDetailsController.qualityList[index];
                                  log("Selected Video Quality: Resolution - ${selectedQuality.resolution}, URL - ${selectedQuality.url}");

                                  videoPlayerController.pause();

                                  // Initialize the new controller with the selected URL
                                  videoPlayerController = VideoPlayerController.network(selectedQuality.url)
                                    ..initialize().then((_) {
                                      videoPlayerController.play();
                                      log("Playing video at resolution: ${selectedQuality.resolution}");
                                      videoPlayerDetailsController.update();
                                      Get.back();
                                    });
                                } catch(e, s){
                                  log("Video Quality Error: ", error: e, stackTrace: s);
                                }
                              });
                            },
                            child: Container(
                              color: Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 5
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  videoPlayerDetailsController.selectQuantity == index
                                      ? Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorRes.appCeruleanColor
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: ColorRes.white,
                                      size: 18,
                                    ),
                                  )
                                      : Container(
                                    height: 22,
                                    width: 22,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: ColorRes.appCeruleanColor,
                                            width: 1
                                        )
                                    ),
                                  ),

                                  sizedBoxW(15),
                                  Expanded(
                                    child: SizedBox(
                                      child: GlobalText(
                                        str: quantityData.resolution,
                                        fontWeight: FontWeight.w500,
                                        color: ColorRes.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),

                  sizedBoxH(10),
                ],
              ),
            );
          }
      );
    });
  }
}

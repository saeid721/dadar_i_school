
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../domain/local/preferences/local_storage.dart';
import '../../../../domain/local/preferences/local_storage_keys.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/images.dart';
import '../../../../global/widget/global_sized_box.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../initializer.dart';
import '../../../../service/auth/view/auth_screen.dart';
import '../../../video_details/controller/video_details_controller.dart';
import '../widget/watch_option_menu_widget.dart';

class WatchMoreVertScreen extends StatefulWidget {
  final String movieId;
  const WatchMoreVertScreen({
    super.key,
    required this.movieId
  });

  @override
  State<WatchMoreVertScreen> createState() => _WatchMoreVertScreenState();
}

class _WatchMoreVertScreenState extends State<WatchMoreVertScreen> {

  int selectLanguage = 0;
  List<String> languageList = [
    "English",
    "বাংলা",
    "हिंदी",
    "عربي",
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoDetailsController>(builder: (videoDetailsController){
      final subscribersId = locator<LocalStorage>().getString(key: StorageKeys.subscribersId);

      return StatefulBuilder(
          builder: (ctx, buildSetState){
            return Container(
              height: 140,
              width: size(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: ColorRes.appBackColor,
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
                  const Row(
                    children: [
                      GlobalText(
                        str: "Watch Option",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    ],
                  ),

                  sizedBoxH(10),
                  WatchOptionMenuWidget(
                      img: Images.deleteIc,
                      title: "Delete from download",
                      onTap: (){
                        if(subscribersId != null){
                          videoDetailsController.reqWatchList(
                              subscriberId: subscribersId,
                              movieId: widget.movieId
                          );
                          Get.back();
                        } else{
                          showDialog(
                              context: context,
                              builder: (ctx){
                                return const AuthScreen();
                              });
                        }
                      }
                  ),

                ],
              ),
            );
          }
      );
    });
  }
}

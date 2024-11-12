
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/features/download/controller/download_controller.dart';
import 'package:dadar_i_school/src/features/download/view/widget/download_widget.dart';
import 'package:dadar_i_school/src/global/constants/colors_resources.dart';
import 'package:dadar_i_school/src/global/constants/images.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_image_loader.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import 'package:dadar_i_school/src/global/widget/global_text.dart';
import '../../../global/widget/global_textform_field.dart';
import 'download_more_vert_screen.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key,});
  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailCon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final downloadController = DownloadController.current;
    downloadController.loadDownloadedVideos();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DownloadController>(builder: (downloadController){
      return Scaffold(
        key: scaffoldKey,
        body: GlobalContainer(
          height: size(context).height,
          width: size(context).width,
          color: ColorRes.appBackColor,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxH(40),
              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: GlobalText(
                  str: "Download",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              sizedBoxH(10),
              GlobalTextFormField(
                controller: emailCon,
                hintText: "Search Movie & Series",
                filled: true,
                fillColor: ColorRes.bottomColor,
                isDense: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: GlobalImageLoader(
                    imagePath: Images.searchIc,
                    color: ColorRes.white200,
                    height: 20,
                    width: 20,
                    fit: BoxFit.fill,
                  ),
                ),
                sufixIcon: emailCon.text.isNotEmpty ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        emailCon.clear();
                      });
                    },
                    child: const GlobalImageLoader(
                      imagePath: Images.close,
                      color: ColorRes.white200,
                      height: 20,
                      width: 20,
                      fit: BoxFit.fill,
                    ),
                  ),
                ) : const SizedBox.shrink(),
                onChanged: (val){
                  setState(() {
                    emailCon.text = val;
                  });
                },
              ),

              sizedBoxH(10),
              Expanded(
                child: ListView.builder(
                  itemCount: downloadController.downloadedVideos.length,
                  padding: const EdgeInsets.only(bottom: 100),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final downloadedVideos = downloadController.downloadedVideos[index];
                    return DownloadMenuWidget(
                      img: downloadedVideos.initImg,
                      text: downloadedVideos.videoName,
                      onTap: (){
                        downloadController.getVideoPlayer(index: index);
                      },
                      moreVertOnTap: (){
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (ctx){
                              return const DownloadMoreVertScreen();
                            }
                        );
                      },
                    );
                  },
                ),
              )

            ],
          ),
        ),
      );
    });
  }
}

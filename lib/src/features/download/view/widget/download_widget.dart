import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dadar_i_school/src/global/widget/global_container.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';

class DownloadMenuWidget extends StatelessWidget {
  final String img;
  final String text;
  // final String subText;
  final Function() onTap;
  final Function() moreVertOnTap;

  const DownloadMenuWidget({
    super.key,
    required this.img,
    required this.text,
    //required this.subText,
    required this.onTap,
    required this.moreVertOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlobalContainer(
        width: size(context).width,
        margin: const EdgeInsets.only(bottom: 10),
        color: ColorRes.grey.withOpacity(0.1),
        borderRadiusCircular:10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),

              child: GlobalImageLoader(
                imagePath: img,
                height: 180,
                width: Get.width,
                fit: BoxFit.fill,
              ),
            ),
            sizedBoxW(5),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GlobalText(
                          str: text,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // GlobalText(
                        //   str: subText,
                        //   fontSize: 9,
                        //   fontWeight: FontWeight.w300,
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                        const GlobalText(
                          str: '2.5M Views',
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: GestureDetector(
                      onTap: moreVertOnTap,
                      child: const Icon(
                        Icons.more_vert_outlined,
                        size: 20,
                        color: ColorRes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../../global/shimmer/shimmer_widget.dart';
import '../../../../../global/widget/global_sized_box.dart';

Widget homeSectionSliderShimmer(BuildContext context) {
  return Stack(
    children: [
      ShimmerWidget.circular(
          height: 550,
          width: size(context).width,
          shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          )
      ),
      Positioned(
        bottom: 10,
        child: Container(
          width: size(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerWidget.circular(
                      height: 25,
                      width: 80,
                      shapeBorder: RoundedRectangleBorder()
                  ),

                  sizedBoxH(5),
                  const ShimmerWidget.circular(
                      height: 25,
                      width: 160,
                      shapeBorder: RoundedRectangleBorder()
                  ),
                ],
              ),

              const ShimmerWidget.circular(
                  height: 50,
                  width: 50,
                  shapeBorder: RoundedRectangleBorder()
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../../global/shimmer/shimmer_widget.dart';

Widget homeSectionRecentShimmer(List<String> itemCount) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: itemCount.asMap().entries.map((item){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: ShimmerWidget.circular(
                    height: 160,
                    width: 115,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
              sizedBoxH(5),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const ShimmerWidget.circular(
                    height: 15,
                    width: 70,
                    shapeBorder: RoundedRectangleBorder()
                ),
              ),
            ],
          );
        }).toList()
      ),
    ),
  );
}

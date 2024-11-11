
import 'package:flutter/material.dart';
import '../../../../../global/shimmer/shimmer_widget.dart';

Widget homeSectionGenresShimmer(List<String> itemCount) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
          children: itemCount.asMap().entries.map((item){
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: ShimmerWidget.circular(
                  height: 170,
                  width: 150,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
            );
          }).toList()
      ),
    ),
  );
}

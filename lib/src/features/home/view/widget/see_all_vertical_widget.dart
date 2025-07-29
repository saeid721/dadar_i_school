// import 'package:flutter/material.dart';
// import 'package:dadar_i_school/src/global/constants/enum.dart';
// import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
// import '../../../../global/constants/colors_resources.dart';
// import '../../../../global/widget/global_image_loader.dart';
// import '../../../../global/widget/global_text.dart';
//
// class SeeAllMenuVerticalWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final String shortDescription;
//   final Function() onTap;
//   const SeeAllMenuVerticalWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.shortDescription,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: size(context).width,
//         margin: EdgeInsets.only(top: 5, bottom: 5),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: ColorRes.appSecondaryColor,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withValues(alpha: 0.1),
//               offset: Offset(0, 1),
//               blurRadius: 5,
//               spreadRadius: .5,
//             ),
//           ],
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 1,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(5),
//                     bottomLeft: Radius.circular(5)
//                 ),
//                 child: GlobalImageLoader(
//                   imagePath: thumbnail,
//                   height: 70,
//                   width: size(context).width,
//                   fit: BoxFit.fill,
//                   imageFor: ImageFor.network,
//                 ),
//               ),
//             ),
//             sizedBoxW(5),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     GlobalText(
//                       str: title,
//                       fontSize: 12,
//                       maxLines: 2,
//                       color: ColorRes.appColor,
//                       fontWeight: FontWeight.w500,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     GlobalText(
//                       str: shortDescription,
//                       fontSize: 11,
//                       maxLines: 2,
//                       color: ColorRes.black,
//                       fontWeight: FontWeight.w400,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:dadar_i_school/src/global/constants/enum.dart';
import 'package:dadar_i_school/src/global/widget/global_sized_box.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';
import '../../../../global/widget/global_text.dart';

class SeeAllMenuVerticalWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String shortDescription;
  final Function() onTap;
  final bool isSelected;
  final String? duration;
  final bool isCompleted;

  const SeeAllMenuVerticalWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.shortDescription,
    required this.onTap,
    this.isSelected = false,
    this.duration,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size(context).width,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelected
              ? ColorRes.appColor.withValues(alpha: 0.1)
              : ColorRes.appSecondaryColor,
          border: isSelected
              ? Border.all(color: ColorRes.appColor, width: 2)
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              offset: const Offset(0, 1),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail with modern styling
              Stack(
                children: [
                  Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          offset: const Offset(0, 2),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GlobalImageLoader(
                        imagePath: thumbnail,
                        height: 80,
                        width: 90,
                        fit: BoxFit.cover,
                        imageFor: ImageFor.network,
                      ),
                    ),
                  ),

                  // Play button overlay
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),

                  // Duration badge
                  if (duration != null)
                    Positioned(
                      bottom: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          duration!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                  // Completion indicator
                  if (isCompleted)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 12,
                        ),
                      ),
                    ),
                ],
              ),

              sizedBoxW(12),

              // Content section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Title with modern typography
                    GlobalText(
                      str: title,
                      fontSize: 14,
                      maxLines: 2,
                      color: isSelected
                          ? ColorRes.appColor
                          : ColorRes.black,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),

                    sizedBoxH(4),

                    // Description with subtle styling
                    GlobalText(
                      str: shortDescription,
                      fontSize: 12,
                      maxLines: 2,
                      color: ColorRes.black.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),

                    sizedBoxH(8),

                    // Status row with modern indicators
                    Row(
                      children: [
                        // Progress indicator
                        if (isCompleted)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.green.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  size: 12,
                                  color: Colors.green[600],
                                ),
                                sizedBoxW(4),
                                Text(
                                  'Completed',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green[600],
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: ColorRes.appColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: ColorRes.appColor.withValues(alpha: 0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  size: 12,
                                  color: ColorRes.appColor,
                                ),
                                sizedBoxW(4),
                                Text(
                                  'Watch',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: ColorRes.appColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        const Spacer(),

                        // Action indicator
                        Icon(
                          isSelected
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_right,
                          color: ColorRes.appColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import '../../../../global/constants/colors_resources.dart';
// import '../../../../global/constants/enum.dart';
// import '../../../../global/widget/global_image_loader.dart';
// import '../../../../global/widget/global_text.dart';
//
// class HundredDaysBasicEnglishMenuWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final Function() onTap;
//   const HundredDaysBasicEnglishMenuWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 180,
//         margin: const EdgeInsets.only(right: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: GlobalImageLoader(
//                     imagePath: thumbnail,
//                     height: 120,
//                     width: 180,
//                     fit: BoxFit.fill,
//                     imageFor: ImageFor.network,
//                   ),
//                 ),
//               ],
//             ),
//             GlobalText(
//               str: title,
//               fontSize: 12,
//               maxLines: 1,
//               color: ColorRes.textColor,
//               overflow: TextOverflow.ellipsis,
//               fontWeight: FontWeight.w400,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BeginnerSpokenEnglishMenuWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final Function() onTap;
//   const BeginnerSpokenEnglishMenuWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 180,
//         margin: const EdgeInsets.only(right: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: GlobalImageLoader(
//                     imagePath: thumbnail,
//                     height: 120,
//                     width: 180,
//                     fit: BoxFit.fill,
//                     imageFor: ImageFor.network,
//                   ),
//                 ),
//               ],
//             ),
//             GlobalText(
//               str: title,
//               fontSize: 12,
//               maxLines: 1,
//               color: ColorRes.textColor,
//               overflow: TextOverflow.ellipsis,
//               fontWeight: FontWeight.w400,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HundredDaysSpokenEnglishMenuWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final Function() onTap;
//   const HundredDaysSpokenEnglishMenuWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 180,
//         margin: const EdgeInsets.only(right: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: GlobalImageLoader(
//                     imagePath: thumbnail,
//                     height: 120,
//                     width: 180,
//                     fit: BoxFit.fill,
//                     imageFor: ImageFor.network,
//                   ),
//                 ),
//               ],
//             ),
//             GlobalText(
//               str: title,
//               fontSize: 12,
//               maxLines: 1,
//               color: ColorRes.textColor,
//               overflow: TextOverflow.ellipsis,
//               fontWeight: FontWeight.w400,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SpokenEnglishPracticeMenuWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final Function() onTap;
//   const SpokenEnglishPracticeMenuWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 180,
//         margin: const EdgeInsets.only(right: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: GlobalImageLoader(
//                     imagePath: thumbnail,
//                     height: 120,
//                     width: 180,
//                     fit: BoxFit.fill,
//                     imageFor: ImageFor.network,
//                   ),
//                 ),
//               ],
//             ),
//             GlobalText(
//               str: title,
//               fontSize: 12,
//               maxLines: 1,
//               color: ColorRes.textColor,
//               overflow: TextOverflow.ellipsis,
//               fontWeight: FontWeight.w400,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class EnglishGrammarCourseMenuWidget extends StatelessWidget {
//   final String thumbnail;
//   final String title;
//   final Function() onTap;
//   const EnglishGrammarCourseMenuWidget({
//     super.key,
//     required this.thumbnail,
//     required this.title,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 180,
//         margin: const EdgeInsets.only(right: 10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(5),
//                   child: GlobalImageLoader(
//                     imagePath: thumbnail,
//                     height: 120,
//                     width: 180,
//                     fit: BoxFit.fill,
//                     imageFor: ImageFor.network,
//                   ),
//                 ),
//               ],
//             ),
//             GlobalText(
//               str: title,
//               fontSize: 12,
//               maxLines: 1,
//               color: ColorRes.textColor,
//               overflow: TextOverflow.ellipsis,
//               fontWeight: FontWeight.w400,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import '../../../../global/constants/colors_resources.dart';
import '../../../../global/constants/enum.dart';
import '../../../../global/widget/global_image_loader.dart';

class CourseMenuWidget extends StatefulWidget {
  const CourseMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.primaryColor,
    this.icon,
    this.showProgress = false,
    this.progress,
  });
  final String thumbnail;
  final String title;
  final String? subtitle;
  final Function() onTap;
  final Color? primaryColor;
  final IconData? icon;
  final bool showProgress;
  final double? progress;


  @override
  State<CourseMenuWidget> createState() => _CourseMenuWidgetState();
}

class _CourseMenuWidgetState extends State<CourseMenuWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        _animationController.forward();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        _animationController.reverse();
        widget.onTap();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: 200,
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black.withValues(alpha: 0.1),
                  width: .5, // Border width
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image with overlay
                      Stack(
                        children: [
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: GlobalImageLoader(
                                imagePath: widget.thumbnail,
                                height: 140,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageFor: ImageFor.network,
                              ),
                            ),
                          ),

                          // Play button
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.1),
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: widget.primaryColor ?? ColorRes.appColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Content
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 10, right: 5, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            if (widget.subtitle != null) ...[
                              const SizedBox(height: 6),
                              Text(
                                widget.subtitle!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],

                            const SizedBox(height: 12),

                            // Progress bar (if needed)
                            if (widget.showProgress) ...[
                              Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: widget.progress ?? 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: widget.primaryColor ?? ColorRes.appColor,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${((widget.progress ?? 0.0) * 100).toInt()}% Complete",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ] else ...[
                              // Action row
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: (widget.primaryColor ?? ColorRes.appColor)
                                            .withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.play_circle_outline,
                                            color: widget.primaryColor ?? ColorRes.appColor,
                                            size: 16,
                                          ),
                                          const SizedBox(width: 6),
                                          Text(
                                            "Start Learning",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: widget.primaryColor ?? ColorRes.appColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Specialized widgets for different course types
class HundredDaysBasicEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;

  const HundredDaysBasicEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseMenuWidget(
      thumbnail: thumbnail,
      title: title,
      subtitle: "100 Day Challenge",
      onTap: onTap,
      primaryColor: Colors.blue[600],
      icon: Icons.calendar_today,
    );
  }
}

class BeginnerSpokenEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;

  const BeginnerSpokenEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseMenuWidget(
      thumbnail: thumbnail,
      title: title,
      subtitle: "Speaking Basics",
      onTap: onTap,
      primaryColor: Colors.green[600],
      icon: Icons.record_voice_over,
    );
  }
}

class HundredDaysSpokenEnglishMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;

  const HundredDaysSpokenEnglishMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseMenuWidget(
      thumbnail: thumbnail,
      title: title,
      subtitle: "Advanced Speaking",
      onTap: onTap,
      primaryColor: Colors.purple[600],
      icon: Icons.chat_bubble_outline,
    );
  }
}

class SpokenEnglishPracticeMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;

  const SpokenEnglishPracticeMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseMenuWidget(
      thumbnail: thumbnail,
      title: title,
      subtitle: "Practice Sessions",
      onTap: onTap,
      primaryColor: Colors.orange[600],
      icon: Icons.mic,
    );
  }
}

class EnglishGrammarCourseMenuWidget extends StatelessWidget {
  final String thumbnail;
  final String title;
  final Function() onTap;

  const EnglishGrammarCourseMenuWidget({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CourseMenuWidget(
      thumbnail: thumbnail,
      title: title,
      subtitle: "Grammar Rules",
      onTap: onTap,
      primaryColor: Colors.red[600],
      icon: Icons.book,
    );
  }
}
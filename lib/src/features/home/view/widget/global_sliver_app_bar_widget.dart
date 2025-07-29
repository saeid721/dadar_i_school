import 'package:flutter/material.dart';

import '../../../../global/constants/colors_resources.dart';
import '../../../../global/widget/global_image_loader.dart';

class GlobalSliverAppBar extends StatelessWidget {
  const GlobalSliverAppBar({
    super.key,
    this.toolbarHeight = 70,
    this.expandedHeight = 300.0,
    this.pinned = true,
    required this.backgroundColor,
    required this.backgroundWidget,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.iconColor = Colors.white,
    required this.titleColor,
    this.subtitleColor = Colors.grey,
    this.containerColor = Colors.white,
  });
  final double toolbarHeight;
  final double expandedHeight;
  final bool pinned;
  final Color backgroundColor;
  final Widget backgroundWidget;
  final String title;
  final String subtitle;
  final String imageUrl;
  final Color iconColor;
  final Color titleColor;
  final Color subtitleColor;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: toolbarHeight,
      iconTheme: IconThemeData(color: iconColor),
      expandedHeight: expandedHeight,
      pinned: pinned,
      backgroundColor: backgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        background: backgroundWidget,
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: ColorRes.appColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: GlobalImageLoader(
                        imagePath: imageUrl,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14,
                            color: subtitleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
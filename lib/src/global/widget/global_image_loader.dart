
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/enum.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader({
    super.key,
    required this.imagePath,
    this.imageFor = ImageFor.asset,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.errorBuilder
  });
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final ImageErrorWidgetBuilder? errorBuilder;
  final ImageFor imageFor;

  @override
  Widget build(BuildContext context) {
    if (imageFor == ImageFor.network) {
      return Image.network(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder ?? (context, exception, stackTrace) => Center(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                child: Image.asset("assets/app_src/dadar_i_school.png",
                    height: height,
                    width: width,
                    fit: BoxFit.fill,
                ),
              ),
            )
          )
      );
    } else if (imageFor == ImageFor.local) {
      log("Image Path2: $imagePath");
      return Image.file(
        File(imagePath),
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder ?? (context, exception, stackTrace) => Center(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                child: Image.asset("assets/app_src/dadar_i_school.png",
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            )
        ),
      );
    } else {
      return Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder ?? (context, exception, stackTrace) => Center(
            child: Opacity(
              opacity: 0.1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 1.0,         // Border width
                  ),
                ),
                child: Image.asset("assets/app_src/dadar_i_school.png",
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ),
              ),
            )
        ),
      );
    }
  }
}

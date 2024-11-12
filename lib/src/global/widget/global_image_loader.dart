
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../domain/server/http_client/app_config.dart';
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
        "${AppConfig.base.url}$imagePath",
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: errorBuilder ?? (context, exception, stackTrace) => Center(
            child: Image.asset("assets/app_src/place_holder_img.jpg",
                height: height,
                width: width,
                fit: BoxFit.fill,
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
            child: Image.asset("assets/app_src/place_holder_img.jpg",
              height: height,
              width: width,
              fit: BoxFit.fill,
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
            child: Image.asset("assets/app_src/place_holder_img.jpg",
                height: height,
                width: width,
                fit: BoxFit.fill
            )
        ),
      );
    }
  }
}

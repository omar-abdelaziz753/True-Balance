import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

class CacheNetworkImagesWidget extends StatelessWidget {
  const CacheNetworkImagesWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.lottiePath,
    this.boxFit,
    this.loadingImage,
    this.haveBorder = true,
  });

  final String image;
  final String? lottiePath;
  final String? loadingImage;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final bool? haveBorder;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith("http")) {
      return ClipRRect(
        borderRadius: haveBorder == true
            ? BorderRadius.circular(AppConstants.borderRadius)
            : BorderRadius.circular(0),
        child: CachedNetworkImage(
            imageUrl: image,
            fit: boxFit,
            width: width ?? double.infinity,
            height: height,
            progressIndicatorBuilder: (context, url, downloadProgress) {
              return Skeletonizer(
                enabled: true,
                child: Container(
                  width: width ?? double.infinity,
                  height: height ?? 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:
                        BorderRadius.circular(AppConstants.borderRadius),
                  ),
                ),
              );
            },
            errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                )),
      );
    } else if (image.endsWith("svg")) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: boxFit!,
      );
    } else {
      return Image.asset(
        image,
        width: width,
        height: height,
        fit: boxFit!,
      );
    }
  }
}

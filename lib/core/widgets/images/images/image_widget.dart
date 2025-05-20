import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.lottiePath,
    this.fit = BoxFit.cover,
    this.loadingImage,
    this.color,
  });

  final String image;
  final String? lottiePath;
  final String? loadingImage;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (image.startsWith("http")) {
      return CachedNetworkImage(
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Image.asset(
            loadingImage ?? "",
            color: color,
            fit: BoxFit.cover,
          );
        },
        errorWidget: (context, url, error) => Image.asset(
          "",
          fit: BoxFit.cover,
        ),
        imageUrl: image,
        fit: fit,
        width: width ?? double.infinity,
        height: height,
        color: color,
      );
    } else if (image.endsWith("svg")) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: fit!,
        color: color,
      );
    } else {
      return Image.asset(
        image,
        width: width ?? double.infinity,
        height: height,
        fit: fit,
        color: color,
      );
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomMainBodyWidget extends StatelessWidget {
  const CustomMainBodyWidget({super.key, required this.bodyWidget});

  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.1,
          child: SvgPicture.asset(
            'assets/images/svg/bg_image.svg',
          ),
        ),
        bodyWidget,
      ],
    );
  }
}

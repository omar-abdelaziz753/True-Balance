// import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final TextStyle mainTextStyle;
  final TextStyle subTextStyles;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    required this.mainTextStyle,
    required this.subTextStyles,
  });

  @override
  ExpandableTextWidgetState createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool isExpanded = false;
  final int maxLines = 3;
  bool shouldShowExpandButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkTextOverflow();
    });
  }

  void _checkTextOverflow() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.mainTextStyle),
      maxLines: maxLines,
      textDirection: ui.TextDirection.rtl,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    setState(() {
      shouldShowExpandButton = textPainter.didExceedMaxLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.text,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            maxLines: isExpanded ? null : maxLines,
            style: widget.mainTextStyle,
          ),
        ),
        if (shouldShowExpandButton) // Only show if text exceeds 4 lines
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "core.readLess".tr() : 'core.readMore'.tr(),
              style: widget.subTextStyles.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: widget.subTextStyles.color,
                color: widget.subTextStyles.color,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomMainBodyWidget extends StatelessWidget {
  const CustomMainBodyWidget({super.key, required this.bodyWidget});

  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      
        bodyWidget,
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SettingsRawWidget extends StatelessWidget {
  const SettingsRawWidget({
    super.key,
    required this.title,
    required this.function,
    this.icon,
    this.color,
  });

  final String title;
  final VoidCallback function;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            const Spacer(),
            IconButton(
              onPressed: function,
              color: color,
              icon: icon != null
                  ? Icon(icon)
                  : const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
            ),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}

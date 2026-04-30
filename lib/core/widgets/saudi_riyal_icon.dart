import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaudiRiyalIcon extends StatelessWidget {
  final double? size;
  final Color? color;

  const SaudiRiyalIcon({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/svg/saudi_riyal.svg',
      width: size ?? 16,
      height: size ?? 16,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}

class RiyalAmount extends StatelessWidget {
  final String amount;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;

  const RiyalAmount({
    super.key,
    required this.amount,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SaudiRiyalIcon(size: fontSize, color: color),
        const SizedBox(width: 2),
        Text(
          amount,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}

String formatRiyal(dynamic amount) {
  if (amount == null) return '0';
  if (amount is String) {
    return double.tryParse(amount)?.toStringAsFixed(2) ?? '0';
  }
  if (amount is num) {
    return amount.toStringAsFixed(2);
  }
  return '0';
}

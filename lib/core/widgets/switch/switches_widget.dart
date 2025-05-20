import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key, required this.onChanged, required this.valueData});

  final bool? valueData;
  final void Function(bool)? onChanged;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.valueData!,
      onChanged: (bool value) {
        setState(() => widget.onChanged?.call(value));
      },
      // activeColor: AppColors.primaryColor500,
      // activeTrackColor: AppColors.primaryColor500,
      // inactiveTrackColor: AppColors.greyScale200,
      trackOutlineWidth: WidgetStateProperty.all(0.w),
      // trackColor: MaterialStateProperty.all(widget.valueData! ? AppColors.primaryColor500 : AppColors.greyScale200),
      // trackOutlineColor: MaterialStateProperty.all(widget.valueData! ? AppColors.primaryColor500 : AppColors.greyScale200),
      // thumbColor: MaterialStateProperty.all(AppColors.whiteColor),
      // thumbIcon: MaterialStateProperty.all(Icon(Icons.circle, color: AppColors.whiteColor)),
    );
  }
}
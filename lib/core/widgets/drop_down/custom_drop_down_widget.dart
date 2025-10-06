import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';
import 'package:truee_balance_app/core/widgets/images/cache_network_image/image_widget.dart';

class CustomDropdownButtonWidget<T> extends StatefulWidget {
  final String? hint;
  final List<T> items;
  final bool isString;
  final String Function(T)? getItemText;
  final String Function(T)? getItemIcon;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;
  final T? value;

  const CustomDropdownButtonWidget({
    super.key,
    this.hint,
    this.isString = true,
    required this.items,
    this.getItemText,
    this.getItemIcon,
    this.onChanged,
    this.validator,
    this.value,
  });

  @override
  CustomDropdownButtonWidgetState<T> createState() =>
      CustomDropdownButtonWidgetState<T>();
}

class CustomDropdownButtonWidgetState<T>
    extends State<CustomDropdownButtonWidget<T>>
    with SingleTickerProviderStateMixin {
  T? selectedValue;
  bool isDropdownOpen = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
      if (isDropdownOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      validator: widget.validator,
      initialValue: widget.value,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: toggleDropdown,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: state.hasError
                        ? Colors.red
                        : AppColors.neutralColor1000,
                    width: 1.w,
                  ),
                  color: AppColors.neutralColor100.withValues(alpha: 0.1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (selectedValue != null && widget.getItemIcon != null)
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: widget.getItemIcon!(selectedValue as T),
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        10.horizontalSpace,
                        Text(
                          selectedValue == null
                              ? (widget.hint ?? 'selectItem'.tr())
                              : (widget.isString
                                  ? selectedValue.toString()
                                  : widget.getItemText!(selectedValue as T)),
                          style: Styles.contentEmphasis,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    AnimatedRotation(
                      turns: isDropdownOpen ? 0.5 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          child: const Icon(Icons.arrow_drop_down_rounded)),
                    ),
                  ],
                ),
              ),
            ),
            SizeTransition(
              sizeFactor: _fadeAnimation,
              axisAlignment: -1.0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  margin: EdgeInsets.only(top: 5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: AppColors.neutralColor1000,
                      width: 1.w,
                    ),
                    color: AppColors.neutralColor100.withValues(alpha: 0.1),
                  ),
                  child: Column(
                    children: widget.items.map((T item) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedValue = item;
                            isDropdownOpen = false;
                          });
                          _animationController.reverse();
                          state.didChange(item); // مهم عشان الـ validator يشتغل
                          if (widget.onChanged != null) widget.onChanged!(item);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 10.w,
                          ),
                          child: Row(
                            children: [
                              if (widget.getItemIcon != null)
                                Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: CacheNetworkImagesWidget(
                                    image: widget.getItemIcon!(item),
                                    width: 24.w,
                                    height: 24.h,
                                    boxFit: BoxFit.contain,
                                  ),
                                ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text(
                                  widget.isString
                                      ? item.toString()
                                      : widget.getItemText!(item),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Radio<T>(
                                value: item,
                                visualDensity: VisualDensity.compact,
                                groupValue: selectedValue,
                                onChanged: (T? newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                    isDropdownOpen = false;
                                  });
                                  _animationController.reverse();
                                  state.didChange(newValue);
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(newValue);
                                  }
                                },
                                activeColor: AppColors.primaryColor700,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 8.w, right: 8.w),
                child: Align(
                  alignment: CacheHelper.getCurrentLanguage() == "ar"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    state.errorText ?? '',
                    style: TextStyle(color: Colors.red, fontSize: 12.sp),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

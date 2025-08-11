import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:truee_balance_app/core/themes/text_colors.dart';

// class CustomBasicAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Color backgroundColor;
//   final String svgAsset;
//   final double height;
//   final Widget? leading;
//   final List<Widget>? actions;

//   const CustomBasicAppBar({
//     super.key,
//     required this.title,
//     required this.backgroundColor,
//     required this.svgAsset,
//     this.height = 84,
//     this.leading,
//     this.actions,
//   });

//   @override
//   Size get preferredSize => Size.fromHeight(height.h);

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: preferredSize,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           AppBar(
//             backgroundColor: backgroundColor,
//             elevation: 0,
//             centerTitle: true,
//             leading: leading ?? const SizedBox.shrink(),
//             actions: actions,
//             title: Text(
//               title,
//               style: Styles.featureEmphasis.copyWith(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Opacity(
//             opacity: 0.1,
//             child: SvgPicture.asset(
//               svgAsset,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class CustomBasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final String svgAsset;
  final double height;
  final Widget? leading;
  final List<Widget>? actions;

  const CustomBasicAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.svgAsset,
    this.height = 84,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(height.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: leading,
      
      actions: actions,
      title: Text(
        title,
        style: Styles.featureEmphasis.copyWith(
          color: Colors.white,
        ),
      ),
      flexibleSpace: Opacity(
        opacity: 0.1,
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

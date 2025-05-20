import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:truee_balance_app/core/cache_helper/cache_helper.dart';
// import 'package:truee_balance_app/core/cache_helper/cache_keys.dart';
// import 'package:truee_balance_app/core/themes/app_colors.dart';
// import 'package:truee_balance_app/core/themes/hex_colors.dart';
// import 'package:truee_balance_app/core/themes/text_colors.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: _AnimatedSplashContent(),
//     );
//   }
// }
//
// class _AnimatedSplashContent extends StatefulWidget {
//   const _AnimatedSplashContent();
//
//   @override
//   State<_AnimatedSplashContent> createState() => _AnimatedSplashContentState();
// }
//
// class _AnimatedSplashContentState extends State<_AnimatedSplashContent>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _logoScale;
//   late Animation<double> _logoOpacity;
//   late Animation<Color?> _bgColor;
//   late Animation<double> _circleOpacity;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 2000),
//       vsync: this,
//     );
//
//     _logoScale = Tween(begin: 0.7, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
//     );
//
//     _logoOpacity = Tween(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.8)),
//     );
//
//     _circleOpacity = Tween(begin: 0.0, end: 0.2).animate(
//       CurvedAnimation(parent: _controller, curve: const Interval(0.8, 1.0)),
//     );
//
//     _bgColor = ColorTween(
//       begin: AppColors.neutralColor100,
//       end: AppColors.primaryColor700,
//     ).animate(
//       CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1.0)),
//     );
//
//     _controller.forward();
//
//     _controller.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         Future.delayed(const Duration(milliseconds: 500), () async {
//           if (!mounted) return;
//           String? token =
//               await CacheHelper.getSecuredString(key: CacheKeys.userToken);
//           if (kDebugMode) print("Authorization Token: $token");
//
//           if (!mounted) return;
//           // context.pushNamed(
//           //   token == null ? Routes.loginScreen : Routes.mainLayoutScreen,
//           // );
//         });
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (_, __) {
//         return Scaffold(
//           backgroundColor: AppColors.primaryColor900,
//           body: Stack(
//             children: [
//               ...List.generate(8, (i) => _buildCircle(i)),
//               Center(
//                 child: FadeTransition(
//                   opacity: _logoOpacity,
//                   child: ScaleTransition(
//                     scale: _logoScale,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withAlpha(0),
//                                 spreadRadius: 0,
//                                 blurRadius: 0,
//                                 offset: const Offset(0, 5),
//                               ),
//                             ],
//                           ),
//                           child: SvgPicture.asset(
//                             'assets/images/svg/app_logo_icon.svg',
//                             width: 150.w,
//                             height: 150.h,
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         Text(
//                           'True Balance App',
//                           style: Styles.heading3.copyWith(
//                             color: AppColors.neutralColor100,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // Widget _buildCircle(int index) {
//   //   final screenSize = MediaQuery.of(context).size;
//   //   final positions = [
//   //     Offset(screenSize.width * 0.1, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.9, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.3, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.7, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.2, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.8, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.4, screenSize.height * 0.3),
//   //     Offset(screenSize.width * 0.6, screenSize.height * 0.7),
//   //   ];
//   //   final sizes = [80.0, 60.0, 100.0, 70.0, 90.0, 50.0, 75.0, 65.0];
//   //
//   //   return Positioned(
//   //     left: positions[index].dx - sizes[index] / 2,
//   //     top: positions[index].dy - sizes[index] / 2,
//   //     child: Opacity(
//   //       opacity: _circleOpacity.value,
//   //       child: Container(
//   //         width: sizes[index],
//   //         height: sizes[index],
//   //         decoration: BoxDecoration(
//   //           shape: BoxShape.circle,
//   //           color: AppColors.neutralColor600,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   // Widget _buildCircle(int index) {
//   //   final screenSize = MediaQuery.of(context).size;
//   //   final positions = [
//   //     Offset(screenSize.width * 0.1, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.9, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.3, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.7, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.2, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.8, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.4, screenSize.height * 0.3),
//   //     Offset(screenSize.width * 0.6, screenSize.height * 0.7),
//   //   ];
//   //
//   //   final widths = [30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0];
//   //   final heights = [55.0, 55.0, 55.0, 55.0, 55.0, 55.0, 55.0, 55.0];
//   //
//   //   return Positioned(
//   //     left: positions[index].dx - widths[index] / 2,
//   //     top: positions[index].dy - heights[index] / 2,
//   //     child: Opacity(
//   //       opacity: _circleOpacity.value,
//   //       child: Container(
//   //         width: widths[index],
//   //         height: heights[index],
//   //         decoration: BoxDecoration(
//   //           color: hexToColor('#f68220'),
//   //           // color: AppColors.neutralColor600,
//   //           borderRadius: BorderRadius.circular(100), // full oval
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   Widget _buildCircle(int index) {
//     final screenSize = MediaQuery.of(context).size;
//
//     final positions = [
//       Offset(screenSize.width * 0.1, screenSize.height * 0.2),
//       Offset(screenSize.width * 0.9, screenSize.height * 0.2),
//       Offset(screenSize.width * 0.3, screenSize.height * 0.8),
//       Offset(screenSize.width * 0.7, screenSize.height * 0.8),
//       Offset(screenSize.width * 0.2, screenSize.height * 0.5),
//       Offset(screenSize.width * 0.8, screenSize.height * 0.5),
//       Offset(screenSize.width * 0.4, screenSize.height * 0.3),
//       Offset(screenSize.width * 0.6, screenSize.height * 0.7),
//     ];
//
//     final widths = [40.0, 40.0, 40.0, 40.0, 40.0, 40.0, 40.0, 40.0];
//     final heights = [80.0, 80.0, 80.0, 80.0, 80.0, 80.0, 80.0, 80.0];
//
//     return Positioned(
//       left: positions[index].dx - widths[index] / 2,
//       top: positions[index].dy - heights[index] / 2,
//       child: Opacity(
//         opacity: _circleOpacity.value,
//         child: ClipOval(
//           child: Container(
//             width: widths[index],
//             height: heights[index],
//             color: hexToColor('#f68220'), // Exact color from your image
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Widget _buildCircle(int index) {
//   //   final screenSize = MediaQuery.of(context).size;
//   //
//   //   final positions = [
//   //     Offset(screenSize.width * 0.1, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.9, screenSize.height * 0.2),
//   //     Offset(screenSize.width * 0.3, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.7, screenSize.height * 0.8),
//   //     Offset(screenSize.width * 0.2, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.8, screenSize.height * 0.5),
//   //     Offset(screenSize.width * 0.4, screenSize.height * 0.3),
//   //     Offset(screenSize.width * 0.6, screenSize.height * 0.7),
//   //   ];
//   //
//   //   // Oval dimensions: taller than wide
//   //   final widths = [30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0, 30.0];
//   //   final heights = [60.0, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0, 60.0];
//   //
//   //   return Positioned(
//   //     left: positions[index].dx - widths[index] / 2,
//   //     top: positions[index].dy - heights[index] / 2,
//   //     child: Opacity(
//   //       opacity: _circleOpacity.value,
//   //       child: Container(
//   //         width: widths[index],
//   //         height: heights[index],
//   //         decoration: BoxDecoration(
//   //           color: hexToColor('#f68220'),
//   //           borderRadius: BorderRadius.circular(100), // This creates the oval shape
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//
// }


import 'package:flutter/material.dart';
import 'package:truee_balance_app/core/extensions/navigation_extension.dart';
import 'package:truee_balance_app/core/routing/routes_name.dart';
import 'package:truee_balance_app/core/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  bool _videoEnded = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();

        _controller.addListener(() {
          if (_controller.value.position >= _controller.value.duration &&
              !_videoEnded) {
            _videoEnded = true;
            _navigateToNext();
          }
        });
      });
  }

  void _navigateToNext() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const MainScreen()),
    // );
    context.pushNamed(Routes.loginScreen);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                _controller.pause();
                _navigateToNext();
              },
            ),
          ),
        ],
      ),
      // body: _controller.value.isInitialized
      //     ? Stack(
      //   children: [
      //     SizedBox.expand(
      //       child: FittedBox(
      //         fit: BoxFit.cover,
      //         child: SizedBox(
      //           width: _controller.value.size.width,
      //           height: _controller.value.size.height,
      //           child: VideoPlayer(_controller),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       top: 40,
      //       right: 20,
      //       child: IconButton(
      //         icon: const Icon(Icons.close, color: Colors.white),
      //         onPressed: () {
      //           _controller.pause();
      //           _navigateToNext();
      //         },
      //       ),
      //     ),
      //   ],
      // )
      //     : Center(
      //   child: LoadingScreen(),
      // ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Main Screen")),
    );
  }
}


class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor800, // لون الخلفية
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // مؤشر التحميل
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                strokeWidth: 4,
              ),
            ),
            const SizedBox(height: 24),
            // نص التطبيق
            Text(
              'True Balance',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    // Initialize splash screens timing
    _initSplash();
  }

  void _initSplash() async {
    // Emit loading state
    emit(SplashLoading(progress: 0.0));

    // Simulate loading resources with progress updates
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      emit(SplashLoading(progress: i / 10));
    }

    // After all resources are loaded, emit completed state
    emit(SplashCompleted());
  }
}
part of 'splash_cubit.dart';


abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {
  final double progress;

  SplashLoading({required this.progress});
}

class SplashCompleted extends SplashState {}
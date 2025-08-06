import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

 int currentBannerIndex = 0;
 
   void changeIndex(int index) {
    currentBannerIndex = index;
    emit(HomeIndexChanged());
  }
}

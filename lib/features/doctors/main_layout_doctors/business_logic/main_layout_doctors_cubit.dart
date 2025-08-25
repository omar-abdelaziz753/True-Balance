import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

part 'main_layout_doctors_state.dart';

class MainLayoutDoctorsCubit extends Cubit<MainLayoutDoctorsState> {
  MainLayoutDoctorsCubit() : super(MainLayoutInitial());

  static MainLayoutDoctorsCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(int index) {
    AppConstants.userMainLayoutInitialScreenIndex2 = index;
    emit(BottomNavDoctorsState(
        AppConstants.userMainLayoutInitialScreenIndex2));
  }
}

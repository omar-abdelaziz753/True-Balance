import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';

part 'main_layout_therapists_state.dart';

class MainLayoutTherapistsCubit extends Cubit<MainLayoutTherapistsState> {
  MainLayoutTherapistsCubit() : super(MainLayoutInitial());

  static MainLayoutTherapistsCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(int index) {
    AppConstants.userMainLayoutInitialScreenIndex = index;
    emit(BottomNavTherapistsState(AppConstants.userMainLayoutInitialScreenIndex));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:truee_balance_app/core/utils/app_constants.dart';
part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutInitial());

  static MainLayoutCubit get(context) => BlocProvider.of(context);

  void changeBottomNavBar(int index) {
    AppConstants.userMainLayoutInitialScreenIndex = index;
    emit(BottomNavState(AppConstants.userMainLayoutInitialScreenIndex));
  }
}

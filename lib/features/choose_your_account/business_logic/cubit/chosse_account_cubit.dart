import 'package:flutter_bloc/flutter_bloc.dart';

part 'chosse_account_state.dart';

class ChosseAccountCubit extends Cubit<ChosseAccountState> {
  ChosseAccountCubit() : super(ChosseAccountInitial());

  int selectd = -1;
  void changeSelected(int v) {
    selectd = v;
    emit(ChosseAccountChangeState());
  }

  // bool value = false;
  // void changeTrue(bool v) {
  //   if (v == value) {
  //     return;
  //   } else {
  //     value != value;
  //   }
  //   emit(ChosseAccountChangeState());
  // }
}

import 'package:flutter_bloc/flutter_bloc.dart';

part 'chosse_account_state.dart';

class ChosseAccountCubit extends Cubit<ChosseAccountState> {
  ChosseAccountCubit() : super(ChosseAccountInitial()) {
    print(selectd);
  }

  int selectd = -1;
  void changeSelected(int v) {
    selectd = v;
    print(selectd);
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

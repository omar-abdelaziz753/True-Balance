import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/medical_reports/data/model/reports_model.dart';
import 'package:truee_balance_app/features/user/medical_reports/data/repo/reports_repo.dart';

part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit(this.reportsRepo) : super(ReportsInitial());

  final ReportsRepo reportsRepo;

  ReportsModel? reportsModel;

  Future<void> getReports() async {
    emit(ReportsLoading());

    final result = await reportsRepo.getReports();

    result.when(
      success: (data) {
        reportsModel = data;
        emit(ReportsSuccess());
      },
      failure: (error) {
        emit(ReportsError());
      },
    );
  }
}

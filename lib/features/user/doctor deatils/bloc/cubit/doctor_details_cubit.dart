import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/model/doctor_details_model.dart';
import 'package:truee_balance_app/features/user/doctor%20deatils/data/repo/doctor_repo.dart';

part 'doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit(this._doctorRepo) : super(DoctorDetailsInitial());

  final DoctorRepo _doctorRepo;

  DoctorDetailsResponse? doctorDetails;

  Future<void> fetchDoctorDetails({required int doctorId}) async {
    emit(DoctorDetailsLoading());

    final result = await _doctorRepo.getAllDoctors(doctorId: doctorId);

    result.when(
      success: (data) {
        doctorDetails = data;
        emit(DoctorDetailsSuccess());
      },
      failure: (error) {
        emit(DoctorDetailsFailure());
      },
    );
  }
}

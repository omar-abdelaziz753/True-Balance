import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:truee_balance_app/core/utils/easy_loading.dart';
import 'package:truee_balance_app/features/user/setting/data/models/profile/get_profile_data_model.dart';
import 'package:truee_balance_app/features/user/setting/data/repos/repos.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settingsRepos) : super(SettingsInitial());

  final SettingsRepos settingsRepos;
  GetProfileDataModel? getProfileDataModel;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  File? profileImage;
  final ImagePicker picker = ImagePicker();

  /// Get Profile Data
  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    final result = await settingsRepos.getProfileData();
    result.when(
      success: (data) {
        getProfileDataModel = data;
        fullNameController.text = getProfileDataModel!.data!.name ?? '';
        phoneController.text = getProfileDataModel!.data!.phone ?? '';
        emailController.text = getProfileDataModel!.data!.email ?? '';
        emit(GetProfileDataSuccessState());
      },
      failure: (error) {
        emit(GetProfileDataErrorState(errorMessage: error.toString()));
      },
    );
  }

  /// Update Profile Data
  Future<void> updateProfileData() async {
    showLoading();
    emit(GetProfileDataLoadingState());
    final result = await settingsRepos.updateProfileData(
      name: fullNameController.text,
      email: emailController.text,
      phone: phoneController.text,
      image: profileImage,
    );
    result.when(
      success: (data) {
        hideLoading();
        emit(UpdateProfileDataSuccessState());
      },
      failure: (error) {
        hideLoading();
        emit(UpdateProfileDataErrorState(errorMessage: error.toString()));
      },
    );
  }

  /// Choose Image
  Future<void> chooseImageFromGallery() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
        emit(ProfileImageSelectedState());
      }
    } catch (e) {
      // print('Error picking image: $e');
      emit(ProfileImageErrorState());
    }
  }
}

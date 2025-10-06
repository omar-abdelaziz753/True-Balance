import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/dio_helper.dart';
import 'package:truee_balance_app/core/networks_helper/dio_helper/end_points.dart';

class SettingsApiServices {
  final DioHelper _dioHelper;

  SettingsApiServices(this._dioHelper);

  /// Get Profile Data
  Future<Response?> getProfileData() async {
    return _dioHelper.get(endPoint: EndPoints.getProfileData);
  }

  /// Update Profile Data
  Future<Response?> updateProfileData({
    String? name,
    String? email,
    String? phone,
    File? image,
    String ?gender,
    int? age,
  }) async {
    // Return null if no valid data is provided
    if ((name == null || name.isEmpty) &&
        (email == null || email.isEmpty) &&
        (phone == null || phone.isEmpty) &&
        gender == null &&
        age == null &&
        image == null) {
      return null;
    }

    final formData = FormData();

    /// Add text fields only if they are non-null and non-empty
    if (name != null && name.isNotEmpty) {
      formData.fields.add(MapEntry('name', name));
    }
    if (email != null && email.isNotEmpty) {
      formData.fields.add(MapEntry('email', email));
    }
    if (phone != null && phone.isNotEmpty) {
      formData.fields.add(MapEntry('phone', phone));
    }
    if (gender != null) {
      formData.fields.add(MapEntry('gender', gender));
    }
    if (age != null) {
      formData.fields.add(MapEntry('age', age.toString()));
    }

    /// Add image file only if it is provided
    if (image != null) {
      final fileName = image.path.split('/').last;
      final mimeType = lookupMimeType(image.path) ?? 'image/jpeg';
      final mediaType = MediaType.parse(mimeType);

      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            image.path,
            filename: fileName,
            contentType: mediaType,
          ),
        ),
      );
    }

    try {
      return await _dioHelper.post(
        endPoint: EndPoints.updateProfileData,
        data: formData,
      );
    } catch (e) {
      return null;
    }
  }
}

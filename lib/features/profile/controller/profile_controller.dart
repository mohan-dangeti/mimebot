import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../../../core/utils/shared/components/widgets/custom_snackbar.dart';
import '../model/edit_profile/edit_profile_model.dart';
import '../model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var profileModel = const ProfileModel().obs;
  var isLoading = true.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<void> fetchUserInfo() async {
    final baseController = BaseController();
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.profile;
    const apiToken = ApiEndPoints.apiToken;
    final regId = await CacheHelper.getData('regId');
    var requestData = {"user_id": regId};

    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        profileModel(ProfileModel.fromJson(responseData));

        if (profileModel.value.status == true) {
          if (kDebugMode) {
            print(
                "Success to fetch category data: ${profileModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        profileModel(ProfileModel.fromJson(responseData));

        if (profileModel.value.status == false) {
          if (kDebugMode) {
            print(
                "Failed to fetch category data: ${profileModel.value.message}");
          }
        } else {
          throw Exception('Status is not false');
        }
      } else {
        throw Exception('Failed to fetch category data');
      }
    } catch (error) {
      if (kDebugMode) {
        print("error: $error");
      }
    } finally {
      isLoading(false);
    }
  }

  var editProfileModel = EditProfileModel().obs;
  Future<void> editProfile({
    required String userName,
    required String userEmail,
    required String userPhone,
  }) async {
    final baseController = BaseController();
    final apiUrl = ApiEndPoints.baseURL + ApiEndPoints.editProfile;
    print("api $apiUrl");
    const apiToken = ApiEndPoints.apiToken;
    final regId = await CacheHelper.getData('regId');

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $apiToken', // If authorization header is needed
    });

    // Add fields to the multipart request
    request.fields['customer_id'] = regId.toString();
    request.fields['user_name'] = userName;
    request.fields['email'] = userEmail;
    request.fields['mobile_number'] = userPhone;

    try {
      isLoading(true);

      // Send the request and get response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        isLoading(false);
        var responseData = json.decode(response.body);
        editProfileModel(EditProfileModel.fromJson(responseData));

        if (editProfileModel.value.status == true) {
          CustomSnackBar.showCustomSnackBar(
              message: "Success", title: '${editProfileModel.value.message}');
          if (kDebugMode) {
            print("Success: ${editProfileModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        isLoading(false);
        var responseData = json.decode(response.body);
        editProfileModel(EditProfileModel.fromJson(responseData));

        if (editProfileModel.value.status == false) {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Failed", title: "${editProfileModel.value.message}");
          if (kDebugMode) {
            print("Failed: ${editProfileModel.value.message}");
          }
        } else {
          throw Exception('Status is not false');
        }
      } else {
        throw Exception('Failed to edit profile');
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error: $error");
      }
      throw Exception('Error occurred while editing profile');
    } finally {
      isLoading(false);
    }
  }
}

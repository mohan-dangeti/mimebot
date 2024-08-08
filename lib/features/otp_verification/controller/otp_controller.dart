import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../../../core/utils/shared/components/widgets/custom_snackbar.dart';
import '../../login/view/login_page.dart';
import '../model/otp_model.dart';
import 'package:http/http.dart' as http;

class OtpController extends GetxController {
  final TextEditingController otp = TextEditingController();
  var otpModel = OtpModel().obs;
  var isLoading = false.obs;

  Future<void> verifyOtp({required String emailId}) async {
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.checkOtp;
    print("api $apiUrl");
    const apiToken = ApiEndPoints.apiToken;

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $apiToken', // If authorization header is needed
    });

    // Add fields to the multipart request
    request.fields['email_id'] = emailId.toString();
    request.fields['otp'] = otp.text.trim();

    try {
      isLoading(true);

      // Send the request and get response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        isLoading(false);
        var responseData = json.decode(response.body);
        otpModel(OtpModel.fromJson(responseData));

        if (otpModel.value.status == true) {
          CustomSnackBar.showCustomSnackBar(
              message: "Success", title: '${otpModel.value.message}');
          Get.offAll(const LoginPage(),transition: Transition.cupertino);
          if (kDebugMode) {
            print("Success: ${otpModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        isLoading(false);
        var responseData = json.decode(response.body);
        otpModel(OtpModel.fromJson(responseData));

        if (otpModel.value.status == false) {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Failed", title: "${otpModel.value.message}");
          if (kDebugMode) {
            print("Failed: ${otpModel.value.message}");
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

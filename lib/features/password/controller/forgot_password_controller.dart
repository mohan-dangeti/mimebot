import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/password/view/forgot_opt.dart';
import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../../../core/utils/shared/components/widgets/custom_snackbar.dart';
import '../model/email_model.dart';
import '../model/forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  var forgotPasswordModel = ForgotPasswordModel().obs;
  var isLoading = true.obs;
  TextEditingController email = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  var loading = false.obs;
  var passwordVisible = true.obs;
  var conPasswordVisible = true.obs;

  void updateVisibility() {
    passwordVisible.toggle();
  }

  void updateConVisibility() {
    conPasswordVisible.toggle();
  }

  Future<void> updatePassword() async {
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.updatePassword;
    print("api $apiUrl");
    const apiToken = ApiEndPoints.apiToken;

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $apiToken', // If authorization header is needed
    });

    // Add fields to the multipart request
    request.fields['email_id'] = email.text.toString();
    request.fields['new_password'] = password.text.trim();
    request.fields['confirm_password'] = confirmPassword.text.trim();

    try {
      isLoading(true);

      // Send the request and get response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        isLoading(false);
        var responseData = json.decode(response.body);
        forgotPasswordModel(ForgotPasswordModel.fromJson(responseData));

        if (forgotPasswordModel.value.status == true) {
          CustomSnackBar.showCustomSnackBar(
              message: "Success",
              title: '${forgotPasswordModel.value.message}');
          // Get.back();
          if (kDebugMode) {
            print("Success: ${forgotPasswordModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        isLoading(false);
        var responseData = json.decode(response.body);
        forgotPasswordModel(ForgotPasswordModel.fromJson(responseData));

        if (forgotPasswordModel.value.status == false) {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Failed", title: "${forgotPasswordModel.value.message}");
          if (kDebugMode) {
            print("Failed: ${forgotPasswordModel.value.message}");
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

  var emailModel = EmailModel().obs;

  Future<void> sendEmail({required String email}) async {
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.forgotPassword;
    print("api $apiUrl");
    const apiToken = ApiEndPoints.apiToken;

    // Create a multipart request
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $apiToken', // If authorization header is needed
    });

    // Add fields to the multipart request
    request.fields['email'] = email.toString();

    try {
      isLoading(true);

      // Send the request and get response
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      print("response$response");

      if (response.statusCode == 200) {
        isLoading(false);
        var responseData = json.decode(response.body);
        emailModel(EmailModel.fromJson(responseData));

        if (emailModel.value.status == true) {
          Get.to(ForgotOtpPage(emailId: email),transition: Transition.cupertino);
          CustomSnackBar.showCustomSnackBar(
              message: "Success",
              title: '${emailModel.value.message}');
          // Get.back();
          if (kDebugMode) {
            print("Success: ${emailModel.value.message}");
          }
        } if (emailModel.value.status == true) {
          CustomSnackBar.showCustomSnackBar(
              message: "Success",
              title: '${emailModel.value.message}');
          // Get.back();
          if (kDebugMode) {
            print("Success: ${emailModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        isLoading(false);
        var responseData = json.decode(response.body);
        emailModel(EmailModel.fromJson(responseData));

        if (emailModel.value.status == false) {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Failed", title: "${emailModel.value.message}");
          if (kDebugMode) {
            print("Failed: ${emailModel.value.message}");
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

  void clearFields() {
    email.clear();
    confirmPassword.clear();
    password.clear();
  }
}

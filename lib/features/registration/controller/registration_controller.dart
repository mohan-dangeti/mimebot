import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mimebot/features/otp_verification/view/otp_verification_page.dart';

import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/utils/shared/components/widgets/custom_snackbar.dart';
import '../model/registration_model.dart';

class RegistrationController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController townController = TextEditingController();
  var loading = false.obs;
  var imagePath = ''.obs;
  var passwordVisible = true.obs;
  var conPasswordVisible = true.obs;

  void updateVisibility() {
    passwordVisible.toggle();
  }

  void updateConVisibility() {
    conPasswordVisible.toggle();
  }

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: source);
    if (imageFile != null) {
      imagePath.value = imageFile.path;
      return File(imageFile.path);
    }
    return null;
  }

  final registrationModel = RegistrationModel().obs;

  Future<void> registerUser() async {
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.register;
    const apiToken = ApiEndPoints.apiToken;

    loading.value = true;

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add fields
      request.fields["api_key"] = apiToken ?? '';
      request.fields["user_name"] = name.text.trim();
      request.fields["phone"] = phone.text.trim();
      request.fields["email"] = email.text.trim();
      request.fields["password"] = password.text.trim();
      request.fields["confrm_pass"] = confirmPassword.text.trim();

      // Add files if present
      if (imagePath.value.isNotEmpty) {
        request.files.add(
            await http.MultipartFile.fromPath('profile', imagePath.value!));
      }

      var response = await request.send();

      // Check response status
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseData = await response.stream.bytesToString();
        registrationModel.value =
            RegistrationModel.fromJson(json.decode(responseData));
        loading.value = false;
        CustomSnackBar.showCustomSnackBar(
          title: 'Successful',
          message: "Please verify otp",
        );
      }
      if (response.statusCode == 400) {
        var responseData = await response.stream.bytesToString();
        registrationModel.value =
            RegistrationModel.fromJson(json.decode(responseData));
        loading.value = false;
        CustomSnackBar.showCustomErrorSnackBar(
          title: 'Registration failed',
          message: registrationModel.value.message.toString(),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      loading.value = false;
    }
  }
  void clearFields() {
    name.clear();
    email.clear();
    phone.clear();
    confirmPassword.clear();
    password.clear();
    flatNoController.clear();
    townController.clear();
    imagePath.value='';
  }
}

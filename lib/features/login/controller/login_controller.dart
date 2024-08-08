import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/cache_helper/cache_helper.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../../../core/utils/shared/components/widgets/custom_snackbar.dart';
import '../../navbar/view/navbar_screen.dart';
import '../model/login_model.dart';
class LoginController extends GetxController {
  var loginModel = const LoginModel().obs;
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  var loading = false.obs;
  var passwordVisible = true.obs;

  void updateVisibility() {
    passwordVisible.toggle();
  }
  Future<void> loginUser() async {
    final baseController = BaseController();
    loading.value = true;
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.login;
    const apiToken = ApiEndPoints.apiToken;
    final requestData = {
      "phone": phone.text.trim(),
      "password": password.text.trim()
    };
    print(requestData);
    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        loading.value = false;
        final responseData = json.decode(response.body);
        loginModel(LoginModel.fromJson(responseData));
        print("responseData $responseData");
        print("status ${loginModel.value.status}");
        if (loginModel.value.status == true) {
          print("login success");
          int? regId = loginModel.value.data?.regId;
          if (regId != null) {
            CacheHelper.saveData("regId", regId.toString());
            CustomSnackBar.showCustomSnackBar(
                message: "Success", title: '${loginModel.value.message}');
            Get.offAll(() => const NavBar(),
                transition: Transition.leftToRightWithFade);
          } else {
            print("user_id not found in response");
            CustomSnackBar.showCustomErrorSnackBar(
                message: "Error", title: "User ID not found");
          }
        } else if (loginModel.value.status == false) {
          CustomSnackBar.showCustomErrorSnackBar(
              message: "Failed", title: '${loginModel.value.message}');
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 401) {
        final responseData = json.decode(response.body);
        loginModel(LoginModel.fromJson(responseData));
        print("status ${loginModel.value.status}");
        loading.value = false;
        if (loginModel.value.status == false) {
          print("login failed");
          CustomSnackBar.showCustomErrorSnackBar(
              title: "Failed", message: '${loginModel.value.message}');
          if (kDebugMode) {
            print("failed to login");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else {
        throw Exception('Failed with exception');
      }
    } catch (error) {
      if (kDebugMode) {
        print("error: $error");
      }
    } finally {
      loading.value = false;
    }
  }
  void clearFields() {
    phone.clear();
    password.clear();
  }
}
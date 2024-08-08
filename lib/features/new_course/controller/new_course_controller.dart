import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../../courses/model/all_course_model.dart';
import '../model/new_course_model.dart';

class NewCourseController extends GetxController {
  var newCourseModel = const NewCourseModel().obs;
  var isLoading = true.obs;

  Future<void> fetchNewCourseVideo() async {
    final baseController = BaseController();
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.newCourses;
    const apiToken = ApiEndPoints.apiToken;
    var requestData = {"api_key": apiToken};

    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        newCourseModel(NewCourseModel.fromJson(responseData));

        if (newCourseModel.value.status == "Success") {
          if (kDebugMode) {
            print(
                "Success to fetch category data: ${newCourseModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        newCourseModel(NewCourseModel.fromJson(responseData));

        if (newCourseModel.value.status == "Failed") {
          if (kDebugMode) {
            print(
                "Failed to fetch category data: ${newCourseModel.value.message}");
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

  //all course
  var allCourseModel = const AllCourseModel().obs;

  Future<void> fetchAllCourse() async {
    final baseController = BaseController();
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.allCourses;
    const apiToken = ApiEndPoints.apiToken;
    var requestData = {"api_key": apiToken};

    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        allCourseModel(AllCourseModel.fromJson(responseData));

        if (allCourseModel.value.status == "Success") {
          if (kDebugMode) {
            print(
                "Success to fetch category data: ${allCourseModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        allCourseModel(AllCourseModel.fromJson(responseData));

        if (allCourseModel.value.status == "Failed") {
          if (kDebugMode) {
            print(
                "Failed to fetch category data: ${allCourseModel.value.message}");
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
}

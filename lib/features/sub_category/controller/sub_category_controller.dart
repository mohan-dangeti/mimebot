import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../model/sub_category_model.dart';


class SubCategoryController extends GetxController {
  var subCategoryModel = const SubCategoryModel().obs;
  var isLoading = true.obs;

  Future<void> fetchSubCategoryData({required String categoryId}) async {
    final baseController = BaseController();
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.course;
    const apiToken = ApiEndPoints.apiToken;
    var requestData = {"api_key": apiToken,"category_id":categoryId};

    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        subCategoryModel(SubCategoryModel.fromJson(responseData));

        if (subCategoryModel.value.status == "Success") {
          if (kDebugMode) {
            print("Success to fetch category data: ${subCategoryModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        subCategoryModel(SubCategoryModel.fromJson(responseData));

        if (subCategoryModel.value.status == "Failed") {
          if (kDebugMode) {
            print("Failed to fetch category data: ${subCategoryModel.value.message}");
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
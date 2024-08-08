import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mimebot/core/helpers/cache_helper/cache_helper.dart';
import 'package:mimebot/features/lessons/model/comments_model.dart';
import '../../../core/helpers/network/helpers/api_endpoints.dart';
import '../../../core/helpers/network/helpers/base_client.dart';
import '../../../core/helpers/network/helpers/base_controller.dart';
import '../model/lessons_model.dart';

class LessonsController extends GetxController {
  var lessonModel = const LessonModel().obs;
  var isLoading = true.obs;
  var curUrl = ''.obs;
  var curTitle = ''.obs;
  var curDescription = ''.obs;
    var lessonId = ''.obs;

  var commentsModel = const CommentsModel().obs;
  
//var comments = <String>[].obs;

  Future<void> fetchComments() async {
    const url = 'http://restapi.mimebot.in/UserApi/comment_list.php';
    const apiToken = 'mimebot@123';
    var requestData = {"api_key": apiToken};
    

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(requestData),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        commentsModel(CommentsModel.fromJson(responseData));

        //comments.value = List<String>.from(responseData['Data'].map((item) => item['comment'].toString()));
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (error) {
      print("Error: $error");
    }
  }
  // Future<void> fetchComments() async {
  //   const url = 'http://restapi.mimebot.in/UserApi/comment_list.php';
  //   const apiToken = 'mimebot@123';
  //   var requestData = {"api_key": apiToken};

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: json.encode(requestData),
  //     );

  //     if (response.statusCode == 200) {
  //       final responseData = json.decode(response.body);
  //       commentsModel(CommentsModel.fromJson(responseData));

  //       if (commentsModel.value.status == "Success") {
  //         if (kDebugMode) {
  //           print("Successfully fetched comments: ${commentsModel.value.message}");
  //         }
  //       } else {
  //         throw Exception('Failed to load comments with status false');
  //       }
  //     } else if (response.statusCode == 400) {
  //       final responseData = json.decode(response.body);
  //       commentsModel(CommentsModel.fromJson(responseData));

  //       if (commentsModel.value.status == "Failed") {
  //         if (kDebugMode) {
  //           print("Failed to fetch comments: ${commentsModel.value.message}");
  //         }
  //       } else {
  //         throw Exception('Failed to load comments with status not failed');
  //       }
  //     } else {
  //       throw Exception('Failed to load comments with status code ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print("Error: $error");
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }




  Future<void> post1(String comment,String lessonId) async {
    try {
      final map = <String, dynamic>{};
          final regId = await CacheHelper.getData('regId');

      map['les_id'] = lessonId;
      map['user_id'] = regId;
      map['comment'] = comment;
print(lessonId);
print(regId);
      final response = await http.post(
          Uri.parse('http://restapi.mimebot.in/UserApi/send_comment.php'),
          body: map);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print(responseData);
       await fetchComments();
        print("success ${response.statusCode}");
      } else {
        throw Exception('Failed to post data');
      }
    } catch (e) {
      print("hello $e");
    }
  }

  Future<void> delApi(String comId) async {
    try {
      final response = await http.post(
        Uri.parse('http://restapi.mimebot.in/UserApi/delete_comment.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{"com_id": comId}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
         final updatedComments = commentsModel.value.data!
            .where((comment) => comment.comId.toString() != comId)
            .toList();
        commentsModel(CommentsModel(data: updatedComments));
        print(responseData);
        print("Delete successful: ${responseData['message']}");
      } else {
        throw Exception('Failed to delete comment');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> fetchLessons({required String courseId}) async {
    final baseController = BaseController();
    const apiUrl = ApiEndPoints.baseURL + ApiEndPoints.lesson;
    const apiToken = ApiEndPoints.apiToken;
    var requestData = {"api_key": apiToken, "course_id": courseId};

    try {
      final baseClient = BaseClient();
      var response = await baseClient
          .postMethod(apiUrl, requestData)
          .catchError(baseController.handleError);

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        lessonModel(LessonModel.fromJson(responseData));
print(responseData);
        if (lessonModel.value.status == "Success") {
          if (kDebugMode) {
            print("Success to fetch category data: ${lessonModel.value.message}");
          }
        } else {
          throw Exception('Status is not true');
        }
      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        lessonModel(LessonModel.fromJson(responseData));

        if (lessonModel.value.status == "Failed") {
          if (kDebugMode) {
            print("Failed to fetch category data: ${lessonModel.value.message}");
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

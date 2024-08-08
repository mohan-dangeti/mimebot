// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:sample_api/services/data_services.dart';

// class CommentsScreen extends StatefulWidget {
//   @override
//   _CommentsScreenState createState() => _CommentsScreenState();
// }

// class _CommentsScreenState extends State<CommentsScreen> {
//   DataServices dataServices = DataServices();
//   List<dynamic> _comments = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchComments();
//   }

//   Future<void> _fetchComments() async {
//     const url = 'http://restapi.mimebot.in/UserApi/comment_list.php';

//     final requestBody = json.encode({
//       'api_key': 'mimebot@123',
//     });

//     try {
//       final response = await http.post(
//         Uri.parse(url),
//         body: requestBody,
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _comments = data['Data'];
//           _isLoading = false;
//         });
//       } else {
//         print("status ${response.statusCode}");
//         throw Exception('Failed to load comments');
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Comments'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//                   itemCount: _comments.length,
//                   itemBuilder: (context, index) {
//           final comment = _comments[index];
//           return ListTile(
//             title: Text(comment['comment']),
//             subtitle: Text('Lesson: ${comment['les_title']}'),
//             trailing: Text(comment['created_at']),
//           );
//                   },
//                 ),
//     );
//   }
// }
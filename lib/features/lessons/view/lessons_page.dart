import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mimebot/features/lessons/model/comments_model.dart';
import 'package:mimebot/features/saved/controller/saved_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:readmore/readmore.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../controller/lessons_controller.dart';

class LessonsPage extends StatefulWidget {
  final String title;
  final String courseId;

  const LessonsPage({Key? key, required this.title, required this.courseId})
      : super(key: key);

  @override
  _LessonsPageState createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  late LessonsController lessonsController;
  late VideoPlayerController _videoPlayerController;
  late SavedController  _savedController;
  ChewieController? _chewieController;
  bool _isPlayerReady = false;
  String selectedLessonTitle = '';
  String selectedLessonDescription = '';
  bool isLiked = false;
  bool isUnLiked = false;
  bool isBookmarked = false;
  bool _commentsExpanded = false;

  TextEditingController commentContoller = TextEditingController();
 // List<String> comments = [];

  @override
  void initState() {
    super.initState();
    lessonsController = Get.put(LessonsController());
        _savedController = Get.put(SavedController());

   lessonsController.fetchComments();
    lessonsController.fetchLessons(courseId: widget.courseId).then((_) {
      if (lessonsController.lessonModel.value.data != null &&
          lessonsController.lessonModel.value.data!.isNotEmpty) {
                        print( lessonsController.lessonModel.value.data!.first.lesId);
print(            lessonsController.lessonModel.value.data!.first.vidImg.toString()
);
            print( lessonsController.lessonModel.value.data!.first);
        lessonsController.curUrl.value =
            lessonsController.lessonModel.value.data!.first.vidImg.toString();
        lessonsController.curTitle.value =
            lessonsController.lessonModel.value.data!.first.lesTitle ?? '';
        lessonsController.curDescription.value =
            lessonsController.lessonModel.value.data!.first.lesDesc ?? '';
            lessonsController.lessonId.value=lessonsController.lessonModel.value.data!.first.lesId.toString();
        initializePlayer(
          url: lessonsController.curUrl.value,
          title: lessonsController.curTitle.value,
          description: lessonsController.curDescription.value,
        );
      }
    });
  }

  Future<void> initializePlayer({
    required String url,
    required String title,
    required String description,
  }) async {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));

    try {
      await _videoPlayerController.initialize();
    } catch (error) {
      print("Video initialization error: $error");
      return;
    }

    setState(() {
      _isPlayerReady = true;
      selectedLessonTitle = title;
      selectedLessonDescription = description;
    });

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      allowMuting: true,
      looping: true,
      autoInitialize: true,
      autoPlay: false, // Set autoPlay to false here
      showControls: true,
      placeholder: Container(color: Colors.black),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    lessonsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_rounded,
              size: 25, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18.sp,
            color: AppColor.whiteColor,
            fontFamily: "poppinsSemiBold",
          ),
        ),
      ),
      body: Obx(() {
        return Container(
          color: Colors.white,
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.width,
                height: 200,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_isPlayerReady &&
                          _videoPlayerController.value.isInitialized)
                        SizedBox(
                          width: Get.width,
                          height: 200, // Match the container height
                          child: AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: Chewie(controller: _chewieController!),
                          ),
                        )
                      else
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 200, // Match the container height
                            color: Colors.white,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Make sure text starts from the left
                                  children: [
                                    Text(
                                      "${lessonsController.curTitle.value}",
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    ReadMoreText(
                                      "${lessonsController.curDescription.value}",
                                      trimLines: 2,
                                      colorClickableText: Colors.blue,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: 'Read less',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  isBookmarked
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  color: isBookmarked
                                      ? Colors.purple
                                      : Colors.grey,
                                ),
                                onPressed: () {
                               _savedController.addSaved("22");
                                  setState(() {
                                    isBookmarked = !isBookmarked;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ),
                  )),
              const Divider(color: Colors.black54, thickness: 2),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "More lessons",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    if (lessonsController.isLoading.value)
                      buildShimmerEffect()
                    else if (lessonsController.lessonModel.value.data == null ||
                        lessonsController.lessonModel.value.data!.isEmpty)
                      Center(
                        child: Text(
                          "No lessons available",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    else
                      buildLessonList(),
                    SizedBox(height: 16.h),
                    const Divider(color: Colors.black54, thickness: 2),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "Comments",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    buildCommentsSection(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildShimmerEffect() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            height: 100.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }

  Widget buildLessonList() {
    final lessons = lessonsController.lessonModel.value.data!;

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        final lesson = lessons[index];
        return InkWell(
          onTap: () {
            lessonsController.curUrl.value = lesson.vidImg.toString();
            lessonsController.curTitle.value = lesson.lesTitle ?? '';
            lessonsController.curDescription.value = lesson.lesDesc ?? '';
            initializePlayer(
              url: lessonsController.curUrl.value,
              title: lessonsController.curTitle.value,
              description: lessonsController.curDescription.value,
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: lesson.lesImg ?? '',
                            fit: BoxFit.fill,
                            placeholder: (context, url) =>
                                Container(color: Colors.grey),
                            errorWidget: (context, url, error) =>
                                Container(color: Colors.grey),
                          ),
                        ),
                        const Center(
                          child: Icon(Icons.play_circle_fill,
                              color: Colors.white, size: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.lesTitle ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      lesson.lesDesc ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildCommentsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: commentContoller,
                  decoration: InputDecoration(
                    hintText: "Add a comment...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                icon: const Icon(Icons.send, color: AppColor.primaryColor),
                onPressed: () async {
                  String comment = commentContoller.text;
                  await lessonsController.post1(comment,lessonsController.lessonId.value);
                //  comments.add(comment);
                  commentContoller.clear();
                  //  setState(() {});
                },
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: lessonsController.commentsModel.value.data!.length,

            itemBuilder: (context, index) {
              var comment = lessonsController.commentsModel.value.data![index];
              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, color: Colors.white, size: 24),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.userName!,
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                          comment.comment!,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (String result) async{
                        if (result == 'delete') {
                  await lessonsController.delApi(comment.comId.toString());

                          //lessonsController.commentsModel.value.data!.length
                          // comments.removeAt(index);
                          // setState(() {});
                          //  lessonsController.delApi(comments);
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(value: 'delete', child: Text('Delete'))
                      ],
                      icon: Icon(Icons.more_vert),
                    )
                  ],
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _commentsExpanded = !_commentsExpanded;
              });
            },
            child: Text(
              _commentsExpanded ? 'Show less' : 'Show more',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



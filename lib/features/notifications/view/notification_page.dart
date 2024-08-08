import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import '../../../core/utils/configs/styles/colors.dart';
import '../controller/notifications_controller.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationController _controller = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    _controller.fetchNotifications();
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat.yMMMd().add_jm().format(parsedDate);
    } catch (e) {
      return date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.primaryColor,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: 25, color: Colors.white),
            ),
            centerTitle: true,
            title: Text(
              "Notifications",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColor.whiteColor,
                fontFamily: "poppinsSemiBold",
              ),
            ),
          ),
          body: Obx(() {
            if (_controller.isLoading.value) {
              return _buildShimmerEffect();
            } else {
              return _buildNotificationList();
            }
          }),
        ),
      ),
    );
  }

  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80.0,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationList() {
    return ListView.builder(
      itemCount: _controller.notificationModel.value.data?.length ?? 0,
      itemBuilder: (context, index) {
        final notification = _controller.notificationModel.value.data![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              title: Text(notification.title ?? ''  ,style: TextStyle(fontSize: 16, color: AppColor.blackTextColor,
                  fontFamily: "poppinsRegular")),
              subtitle: Text(
                notification.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: AppColor.blackTextColor,
                      fontFamily: "poppinsRegular")
              ),
              trailing: Text(formatDate(notification.createdDt ?? ''),  style: TextStyle(fontSize: 12, color: AppColor.blackTextColor,
                  fontFamily: "poppinsRegular")),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(notification.title ?? '',  style: TextStyle(fontSize: 16, color: AppColor.blackTextColor,
                          fontFamily: "poppinsSemiBold")),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification.description ?? '',
                            style: TextStyle(fontSize: 16, color: AppColor.blackTextColor,
                                fontFamily: "poppinsRegular"),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Date: ${formatDate(notification.createdDt ?? '')}',
                            style: TextStyle(fontSize: 14, color: AppColor.blackTextColor,
                                fontFamily: "poppinsRegular"),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text('Close',style: TextStyle( fontSize: 16.sp,
                              color: AppColor.blackTextColor,
                              fontFamily: "poppinsSemiBold"),),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/notification_screen/controller/notification_controller.dart';
import 'package:associations_app/presentation/notification_screen/models/notification_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.notifications.isEmpty) {
          return Shimmer.fromColors(
            baseColor: ConstData.shimmerClrBase(context),
            highlightColor: ConstData.shimmerClrHighLight(context),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 6,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: SizedBox(height: 80),
                  ),
                );
              },
            ),
          );
        } else if (controller.notifications.isNotEmpty) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: controller.notifications.length,
            itemBuilder: (context, index) {
              final data = controller.notifications[index];
              Color randomColor =
                  NotificationData.colorList[controller.random.nextInt(
                    NotificationData.colorList.length,
                  )];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2,
                ),
                child: Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(data.id.toString()),
                  onDismissed: (direction) async {
                    controller.notifications.removeAt(index);
                    await controller.api.deleteNotification(data.id!);
                    controller.fetchNotification();
                  },
                  background: Card(
                    color: Colors.red,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            CupertinoIcons.delete_solid,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Card(
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: ConstData.secondaryClr.withValues(
                                alpha: .2,
                              ),
                            ),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: randomColor,
                            child: Text(
                              data.header![0],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: Text(data.header!),
                          subtitle: Text(data.message!),
                        ),
                      ),
                      if (data.isRead == false)
                        Positioned(
                          right: 15,
                          top: 15,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: Text('No Notifications'));
        }
      }),
    );
  }
}

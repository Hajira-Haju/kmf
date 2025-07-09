import 'package:associations_app/core/constants/const_datas.dart';
import 'package:associations_app/presentation/notification_screen/controller/notification_controller.dart';
import 'package:associations_app/presentation/notification_screen/models/notification_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

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
        return AnimatedCrossFade(
          firstChild: Shimmer.fromColors(
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
          ),
          secondChild:
              controller.notifications.isNotEmpty
                  ? ListView.builder(
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
                      DateTime utcTime = DateTime.parse(data.dateTime!).toUtc();
                      DateTime istTime = utcTime.add(
                        Duration(hours: 5, minutes: 30),
                      );
                      DateTime kwtTime = utcTime.add(Duration(hours: 3));
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4,
                        ),
                        child: Slidable(
                          key: Key(data.id.toString()),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(), // Smooth drag motion
                            extentRatio:
                                0.25, // How much to slide to reveal action
                            children: [
                              SlidableAction(
                                borderRadius: BorderRadius.circular(4),
                                onPressed: (context) async {
                                  controller.notifications.removeAt(index);
                                  await controller.api.deleteNotification(
                                    data.id!,
                                  );
                                  controller.fetchNotification();
                                },
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.all(0),
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
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.message ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if ((data.message?.length ?? 0) >
                                          60) // adjust threshold as needed
                                        GestureDetector(
                                          onTap:
                                              () => controller.showNotification(
                                                data.header!,
                                                data.message!,
                                                context,
                                              ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 4.0,
                                            ),
                                            child: Text(
                                              'Read more',
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  trailing: Text(timeago.format(kwtTime)),
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
                  )
                  : Center(child: Text('No Notifications')),
          crossFadeState:
              controller.isLoading.value && controller.notifications.isEmpty
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 500),
        );
      }),
    );
  }
}

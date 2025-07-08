class NotificationModel {
  List<NotificationList>? notificationList;
  bool? isUnRead;

  NotificationModel({this.notificationList, this.isUnRead});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['notificationList'] != null) {
      notificationList = <NotificationList>[];
      json['notificationList'].forEach((v) {
        notificationList!.add(new NotificationList.fromJson(v));
      });
    }
    isUnRead = json['isUnRead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationList != null) {
      data['notificationList'] =
          this.notificationList!.map((v) => v.toJson()).toList();
    }
    data['isUnRead'] = this.isUnRead;
    return data;
  }
}

class NotificationList {
  int? id;
  String? header;
  String? message;
  bool? isRead;
  String? dateTime;

  NotificationList({this.id, this.header, this.message, this.isRead});

  NotificationList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    message = json['message'];
    isRead = json['isRead'];
    dateTime = json['createdDateUtc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['message'] = this.message;
    data['isRead'] = this.isRead;
    return data;
  }
}

import 'package:associations_app/core/data/api_client/api_list/api_list.dart';

class NewsAndEventsModel {
  int? id;
  String? heading;
  String? description;
  String? imagePath;
  String? date;
  String? type;

  NewsAndEventsModel({
    this.id,
    this.heading,
    this.description,
    this.imagePath,
    this.date,
    this.type,
  });

  NewsAndEventsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['description'];
    imagePath = '${ApiList.baseUrl}${json['imagePath']}';
    date = json['date'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['imagePath'] = this.imagePath;
    data['date'] = this.date;
    data['type'] = this.type;
    return data;
  }
}

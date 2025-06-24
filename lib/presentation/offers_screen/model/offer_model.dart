import 'package:associations_app/core/data/api_client/api_list/api_list.dart';

class OfferModel {
  int? offerId;
  String? offerHeader;
  String? offerDescription;
  String? imagePath;
  String? offerDate;

  OfferModel({
    this.offerId,
    this.offerHeader,
    this.offerDescription,
    this.imagePath,
    this.offerDate,
  });

  OfferModel.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    offerHeader = json['offerHeader'];
    offerDescription = json['offerDescription'];
    imagePath = '${ApiList.baseUrl}${json['imagePath']}';
    offerDate = json['offerDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['offerId'] = this.offerId;
    data['offerHeader'] = this.offerHeader;
    data['offerDescription'] = this.offerDescription;
    data['imagePath'] = this.imagePath;
    data['offerDate'] = this.offerDate;
    return data;
  }
}

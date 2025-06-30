import 'package:associations_app/core/data/api_client/api_list/api_list.dart';

class OfficialsModel {
  String? groupName;
  List<CommitteMembers>? committeMembers;

  OfficialsModel({this.groupName, this.committeMembers});

  OfficialsModel.fromJson(Map<String, dynamic> json) {
    groupName = json['groupName'];
    if (json['committeMembers'] != null) {
      committeMembers = <CommitteMembers>[];
      json['committeMembers'].forEach((v) {
        committeMembers!.add(new CommitteMembers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupName'] = this.groupName;
    if (this.committeMembers != null) {
      data['committeMembers'] =
          this.committeMembers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CommitteMembers {
  String? imagePath;
  String? memberName;
  String? designation;
  String? phoneNumber;

  CommitteMembers(
      {this.imagePath, this.memberName, this.designation, this.phoneNumber});

  CommitteMembers.fromJson(Map<String, dynamic> json) {
    imagePath = "${ApiList.baseUrl}${json['imagePath']}";
    memberName = json['memberName'];
    designation = json['designation'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagePath'] = this.imagePath;
    data['memberName'] = this.memberName;
    data['designation'] = this.designation;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
class CivilIdModel {
  String? imagepath;
  String? membername;
  bool? paymentStatus;
  String? membershipNo;
  String? civilId;
  String? area;
  String? zone;
  String? unit;
  String? profession;
  String? workPlace;
  String? mobileNo;
  String? email;

  CivilIdModel(
      {this.imagepath,
        this.membername,
        this.paymentStatus,
        this.membershipNo,
        this.civilId,
        this.area,
        this.zone,
        this.unit,
        this.profession,
        this.workPlace,
        this.mobileNo,
        this.email});

  CivilIdModel.fromJson(Map<String, dynamic> json) {
    imagepath = json['imagepath'];
    membername = json['membername'];
    paymentStatus = json['paymentStatus'];
    membershipNo = json['membershipNo'];
    civilId = json['civilId'];
    area = json['area'];
    zone = json['zone'];
    unit = json['unit'];
    profession = json['profession'];
    workPlace = json['workPlace'];
    mobileNo = json['mobileNo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imagepath'] = this.imagepath;
    data['membername'] = this.membername;
    data['paymentStatus'] = this.paymentStatus;
    data['membershipNo'] = this.membershipNo;
    data['civilId'] = this.civilId;
    data['area'] = this.area;
    data['zone'] = this.zone;
    data['unit'] = this.unit;
    data['profession'] = this.profession;
    data['workPlace'] = this.workPlace;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    return data;
  }
}

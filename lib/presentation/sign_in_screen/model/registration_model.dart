class RegistrationModel {
  String? name;
  String? membershipId;
  int? phoneNumber;
  bool? otpRequired;
  bool? isBlackListed;
  bool? isBlocked;
  String? token;
  bool? isRegistered;
  String? civilId;
  bool? active;
  dynamic createdBy;
  dynamic createdDate;
  dynamic updatedBy;
  dynamic updatedDate;
  dynamic createdDateFormatted;
  int? diffId;
  dynamic createdUsername;

  RegistrationModel({
    this.name,
    this.membershipId,
    this.phoneNumber,
    this.otpRequired,
    this.isBlackListed,
    this.isBlocked,
    this.token,
    this.isRegistered,
    this.civilId,
    this.active,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.createdDateFormatted,
    this.diffId,
    this.createdUsername,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    membershipId = json['membershipId'];
    phoneNumber = json['phoneNumber'];
    otpRequired = json['otpRequired'];
    isBlackListed = json['isBlackListed'];
    isBlocked = json['isBlocked'];
    token = json['token'];
    isRegistered = json['isRegistered'];
    civilId = json['civilId'];
    active = json['active'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
    createdDateFormatted = json['createdDateFormatted'];
    diffId = json['diffId'];
    createdUsername = json['createdUsername'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['membershipId'] = this.membershipId;
    data['phoneNumber'] = this.phoneNumber;
    data['otpRequired'] = this.otpRequired;
    data['isBlackListed'] = this.isBlackListed;
    data['isBlocked'] = this.isBlocked;
    data['token'] = this.token;
    data['isRegistered'] = this.isRegistered;
    data['civilId'] = this.civilId;
    data['active'] = this.active;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    data['createdDateFormatted'] = this.createdDateFormatted;
    data['diffId'] = this.diffId;
    data['createdUsername'] = this.createdUsername;
    return data;
  }
}

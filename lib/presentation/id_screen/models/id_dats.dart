import 'package:associations_app/presentation/id_screen/models/civil_id_model.dart';

class IdData {
  IdData(this.data) {
    idData = [
      IdCardModel(head: 'Membership No.', value: data.membershipNo!),
      IdCardModel(head: 'Civil ID No.', value: data.civilId!),
      IdCardModel(head: 'Area', value: data.area!),
      IdCardModel(head: 'Zone', value: data.zone!),
      IdCardModel(head: 'Unit', value: data.unit!),
      IdCardModel(head: 'Profession', value: data.profession!),
      IdCardModel(head: 'Workplace', value: data.workPlace!),
      IdCardModel(head: 'Mobile No.', value: data.mobileNo!),
      IdCardModel(head: 'Email', value: data.email!),
    ];
    userData = {
      'name': data.membername,
      'Membership No.': data.membershipNo,
      'Civil ID No.': data.civilId,
      'Area': data.area,
      'Zone': data.zone,
      'Unit': data.unit,
      'Profession': data.profession,
      'Workplace': data.workPlace,
      'Mobile No.': data.mobileNo,
      'Email': data.email,
    };
  }
  late Map<String, dynamic> userData;
  late List<IdCardModel> idData;
  final CivilIdModel data;
}

class IdCardModel {
  final String head;
  final String value;
  IdCardModel({required this.head, required this.value});
}

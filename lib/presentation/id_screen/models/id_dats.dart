class IdData {
  static Map<String, dynamic> userData = {
    'name': 'Test User',
    'email': 'test@skaktec.com',
    'id': 12345,
  };
  static List<IdCardModel> idData = [
    IdCardModel(head: 'Membership No.', value: '1122334455'),
    IdCardModel(head: 'Civil ID No.', value: '123456789012'),
    IdCardModel(head: 'Area', value: 'area1'),
    IdCardModel(head: 'Zone', value: 'zone1'),
    IdCardModel(head: 'Unit', value: 'test unit'),
    IdCardModel(head: 'Profession', value: 'professor'),
    IdCardModel(head: 'Workplace', value: 'testwork'),
    IdCardModel(head: 'Mobile No.', value: '12345678'),
    IdCardModel(head: 'Email', value: 'test@skaktech.com'),
  ];
}

class IdCardModel {
  final String head;
  final String value;
  IdCardModel({required this.head, required this.value});
}

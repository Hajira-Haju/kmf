class IdData {
  static Map<String, dynamic> userData = {
    'name': 'Test User',
    'email': 'test@skaktec.com',
    'id': 12345,
  };
  static List<IdCardModel> idData = [
    IdCardModel(head: 'E-mail', value: 'test@skaktech.com'),
    IdCardModel(head: 'DOB', value: '12/12/2000'),
    IdCardModel(head: 'Nationality', value: 'India'),
    IdCardModel(head: 'Role', value: 'Member'),
    IdCardModel(head: 'Member Since', value: 'Jan 2020'),
  ];
}

class IdCardModel {
  final String head;
  final String value;
  IdCardModel({required this.head, required this.value});
}

class OfficialData {
  static List<OfficialsModel> officialsData = [
    OfficialsModel(
      name: 'Geetha Sudharshan',
      img: 'http://kmfkuwait.com/img/p.jpg',
      ph: "+965 66924313",
      pos: "President",
    ), OfficialsModel(
      name: 'Lijo Adukkolil',
      img: 'http://kmfkuwait.com/img/Lijo.jpg',
      ph: "+965 66924313",
      pos: "General Secretary",
    ), OfficialsModel(
      name: 'Jagadeesh Chandran',
      img: 'http://kmfkuwait.com/img/t.jpg',
      ph: "+965 66924313",
      pos: "Treasurer",
    ),
  ];
}

class OfficialsModel {
  OfficialsModel({
    required this.name,
    required this.img,
    required this.ph,
    required this.pos,
  });
  final String img;
  final String name;
  final String pos;
  final String ph;
}

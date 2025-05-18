import 'package:get/get.dart';

class NewsInnerController extends GetxController{
  final arg = Get.arguments;
  String get imgUrl => arg['imgUrl'];
  String get head => arg['head'];
  String get content => arg['content'];
}
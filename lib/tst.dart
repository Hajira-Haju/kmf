// news_events_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// news_events_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NewsAndEventsModel {
  final int id;
  final String heading;
  final String description;
  final String imagePath;
  final String date;
  final String type;

  NewsAndEventsModel({
    required this.id,
    required this.heading,
    required this.description,
    required this.imagePath,
    required this.date,
    required this.type,
  });

  factory NewsAndEventsModel.fromJson(Map<String, dynamic> json) {
    return NewsAndEventsModel(
      id: json['id'],
      heading: json['heading'] ?? '',
      description: json['description'] ?? '',
      imagePath: json['imagePath'] ?? '',
      date: json['date'] ?? '',
      type: json['type'] ?? '',
    );
  }
}

class NewsEventsController extends GetxController {
  RxList<NewsAndEventsModel> newsList = <NewsAndEventsModel>[].obs;
  RxBool isLoading = false.obs;
  int currentPage = 1;
  int nextPage = 1;

  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 400) {
        print(scrollController.position.pixels);
        print(scrollController.position.maxScrollExtent - 200);
        if (!isLoading.value && nextPage != 0) {
          fetchNews();
        }
      }
    });
  }

  Future<void> fetchNews() async {
    final bool isConnected =
        await InternetConnectionChecker.instance.hasConnection;
    if (isConnected) {
      print('Device is connected to the internet');
      ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
    } else {
      ScaffoldMessenger.of(Get.context!).showMaterialBanner(
        MaterialBanner(
          content: Text('This is a material banner message.'),
          leading: Icon(Icons.info, color: Colors.white),
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
              },
              child: Text('DISMISS', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
      print('Device is not connected to the internet');
    }
    if (nextPage == 0) return;
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(
          'http://skaktech-005-site27.otempurl.com/api/KMF/GetAllNewsAndEventsData?Type=0&PageNumber=$currentPage',
        ),
        headers: {'Authorization': 'Bearer ${GetStorage().read('token')}'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final List<dynamic> list = jsonData['newsOrEventsData'];
        nextPage = jsonData['nextPageNumber'] ?? 0;

        final news = list.map((e) => NewsAndEventsModel.fromJson(e)).toList();
        newsList.addAll(news);

        if (nextPage != 0) {
          currentPage = nextPage;
        }
      }
    } catch (e) {
      print('Error fetching news: $e');
    }
    isLoading.value = false;
  }
}

class NewsEventsPage extends StatelessWidget {
  const NewsEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NewsEventsController());

    return Scaffold(
      appBar: AppBar(title: const Text('News & Events')),
      body: Obx(() {
        if (controller.newsList.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          controller: controller.scrollController,
          itemCount: controller.newsList.length + 1, // +1 for loader
          itemBuilder: (context, index) {
            if (index < controller.newsList.length) {
              final NewsAndEventsModel item = controller.newsList[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: Image.network(
                    'http://skaktech-005-site27.otempurl.com${item.imagePath}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (_, __, ___) => const Icon(Icons.broken_image),
                  ),
                  title: Text(item.heading),
                  subtitle: Text(item.date),
                ),
              );
            } else {
              return controller.nextPage != 0
                  ? GestureDetector(onTap: () {
                print('chec');
                ScaffoldMessenger.of(Get.context!).showMaterialBanner(
                  MaterialBanner(
                    content: Text('This is a material banner message.'),
                    leading: Icon(Icons.info, color: Colors.white),
                    backgroundColor: Colors.blue,
                    actions: [
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(Get.context!).hideCurrentMaterialBanner();
                        },
                        child: Text('DISMISS', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                );
                  },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator(backgroundColor: Colors.red,)),
                    ),
                  )
                  : const SizedBox();
            }
          },
        );
      }),
    );
  }
}

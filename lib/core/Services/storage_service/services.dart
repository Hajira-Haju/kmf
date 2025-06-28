import 'dart:convert';

import 'package:associations_app/core/Services/storage_service/storage_service.dart';
import 'package:associations_app/presentation/new_events_screen/models/event_type_model.dart';
import 'package:associations_app/presentation/new_events_screen/models/news_and_events_model.dart';

import '../../../presentation/offers_screen/model/offer_model.dart';

class Services {
  final storage = StorageService();
  Future<List<OfferModel>> loadOffersFromCache() async {
    final storedData = await storage.read('offerData');
    if (storedData == null) {
      return []; // No cache available
    }
    final data = jsonDecode(storedData) as List;
    return data.map((e) => OfferModel.fromJson(e)).toList();
  }

  Future<List<NewsAndEventsModel>> loadLatestFromCache() async {
    final storedData = await storage.read('latestUpdates');
    if (storedData == null) {
      return []; // No cache available
    }
    final data = jsonDecode(storedData) as List;
    return data.map((e) => NewsAndEventsModel.fromJson(e)).toList();
  }

  Future<List<NewsAndEventsModel>> loadNewsOrEventsFromCache() async {
    final storedData = await storage.read('newsOrEvents');
    if (storedData == null) {
      return []; // No cache available
    }
    final data = jsonDecode(storedData) as List;
    return data.map((e) => NewsAndEventsModel.fromJson(e)).toList();
  }

  Future<List<EventTypeModel>> loadEventTypeFromCache() async {
    final storedData = await storage.read('eventType');
    if (storedData == null) {
      return []; // No cache available
    }
    final data = jsonDecode(storedData) as List;
    return data.map((e) => EventTypeModel.fromJson(e)).toList();
  }

  Future<dynamic> loadAboutUsFromCache() async {
    final storedData = await storage.read('aboutUs');
    if (storedData == null) {
      return null; // No cache available
    }
    final data = jsonDecode(storedData);
    return data['htmlContent'];
  }

  Future<dynamic> loadReferAFriendFromCache() async {
    final storedData = await storage.read('referAFriend');
    if (storedData == null) {
      return null; // No cache available
    }
    final data = jsonDecode(storedData);
    return data['htmlContent'];
  }
  Future<dynamic> loadQuickContactFromCache() async {
    final storedData = await storage.read('quickContact');
    if (storedData == null) {
      return null; // No cache available
    }
    final data = jsonDecode(storedData);
    return data['htmlContent'];
  }
}

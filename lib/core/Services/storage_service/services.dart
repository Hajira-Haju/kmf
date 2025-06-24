import 'dart:convert';

import 'package:associations_app/core/Services/storage_service/storage_service.dart';

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
}
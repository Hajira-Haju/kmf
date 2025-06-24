import 'package:get/get.dart';

import '../../../core/data/api_client/api_service/api_service.dart';
import '../model/offer_model.dart';

class OffersController extends GetxController {
 late Future<List<OfferModel>> futureOffer;
 final api = ApiService();
 @override
  void onInit() {
    // TODO: implement onInit
   futureOffer = api.fetchOffer();
    super.onInit();
  }
}

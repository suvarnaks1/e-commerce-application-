import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_const.dart';
import '../model/shop_items_model.dart';

class ShopNetworking {
  final Client = http.Client();

  late List<ShopItemsModel> shopItemsModelList;

  Future<List<ShopItemsModel>> getShopItemList() async {
    try {
      final request = await Client.get(Uri.parse(uriEndpoint));
      if (request.statusCode == 200) {
        final List<dynamic> response = jsonDecode(request.body); // Decode as a list
        shopItemsModelList = response
            .map((item) => ShopItemsModel.fromJson(item)) // Map each item to ShopItemsModel
            .toList();
        print(response);
      }
    } catch (e) {
      throw Exception("Error fetching shop items: $e");
    }
    return shopItemsModelList;
  }
}

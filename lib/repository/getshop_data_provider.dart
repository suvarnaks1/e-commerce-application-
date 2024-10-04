import 'package:flutter/foundation.dart';

import '../model/shop_items_model.dart';
import '../services/api_service.dart';

class ShopListNotifier with ChangeNotifier {
  final ShopNetworking _shopListData = ShopNetworking();

  late List<ShopItemsModel> shopItemsModelList;
  Future<List<ShopItemsModel>> getShop() async {
    shopItemsModelList = await _shopListData.getShopItemList();
    return shopItemsModelList;
  }
}

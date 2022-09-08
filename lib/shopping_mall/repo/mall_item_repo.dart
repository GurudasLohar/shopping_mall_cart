import 'dart:convert';
import 'package:dio/dio.dart';
import '../app_constants.dart';
import '../data/model/shopping_mall_item.dart';

abstract class MallItemRepo {
  Future<List<ShoppingMallItem>> getMallItemList();
}

class MallItemRepository implements MallItemRepo {
  var dio = Dio();
  late List<ShoppingMallItem> listItem;
  var bodyParameter = {"page": 1, "perPage": 5};

  @override
  Future<List<ShoppingMallItem>> getMallItemList() async {
    final response = await dio.get(
      AppConstants.apiUrl,
      options: Options(
        headers: {
          'token': AppConstants.apiToken,
        },
      ),
      queryParameters: bodyParameter,
    );
    ShoppingMallItemAll shoppingMallItem =
        ShoppingMallItemAll.fromJson(json.decode(response.data));
    listItem = shoppingMallItem.data;
    return listItem;
  }
}

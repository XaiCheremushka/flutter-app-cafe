
import 'package:flutter_course/src/features/menu/models/drink_model.dart';

class DataFunctions {

  static Map<String, int> countingPurchases(List<DrinkModel> productsList) {
    final Map<String, int> productsMap = {};

    for (DrinkModel item in productsList) {
      String id = item.id.toString();
      if (productsMap.containsKey(id)) {
        productsMap[id] = productsMap[id]! + 1;
      } else {
        productsMap[id] = 1;
      }
    }

    return productsMap;
  }

}
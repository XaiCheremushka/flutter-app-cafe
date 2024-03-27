import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/models/drink_model.dart';

class DataBuyProducts extends ChangeNotifier {
  List<DrinkModel> _dataBuyProducts = [];

  List<DrinkModel> get data => _dataBuyProducts;

  void addNewProductData(DrinkModel newData) {
    _dataBuyProducts.add(newData);
    notifyListeners(); // Сообщаем виджетам, что данные изменились
  }

  void removeProductData(DrinkModel newData) {
    _dataBuyProducts.remove(newData);
    notifyListeners(); // Сообщаем виджетам, что данные изменились
  }

  void clearProductData() {
    _dataBuyProducts.clear();
    notifyListeners(); // Сообщаем виджетам, что данные изменились
  }
}

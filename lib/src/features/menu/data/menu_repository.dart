import 'package:dio/dio.dart';

import 'package:flutter_course/src/features/menu/models/drink_model.dart';
import 'package:flutter_course/src/features/menu/models/price_model.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';

class MenuProductRepository {
  static Future<List<DrinkModel>> getProductsList() async {
    final response = await Dio().get(
      'https://coffeeshop.academy.effective.band/api/v1/products?page=0&limit=50'
    );

    final data = response.data as Map<String, dynamic>;
    var dataList = data['data'] as List;

    List<DrinkModel> drinkList = [];
    for (dynamic item in dataList) {
      final String img = item['imageUrl'].toString();
      final String name = item['name'].toString();
      final String description = item['description'].toString();
      final SectionModel category = SectionModel(
        id: int.parse(item['category']['id'].toString()),
        slug: item['category']['slug'].toString()
      );
      final PriceModel price = PriceModel(
        currency: item['prices'][0]['currency'].toString(),
        price: item['prices'][0]['value'].toString()
      );

      drinkList.add(DrinkModel(
        img: img,
        name: name,
        description: description,
        section: category,
        price: price,
      ),);
    }
    return drinkList;
  }

  static Future<List<SectionModel>> getSectionList() async {
    final response = await Dio().get(
        'https://coffeeshop.academy.effective.band/api/v1/products/categories'
    );

    final data = response.data as Map<String, dynamic>;
    var dataList = data['data'] as List;

    List<SectionModel> sectionList = [];
    for (dynamic item in dataList) {
      final int id = int.parse(item['id'].toString());
      final String slug = item['slug'].toString();

      sectionList.add(SectionModel(
        id: id,
        slug: slug,
      ),);
    }

    return sectionList;
  }
}

import 'package:flutter_course/src/features/menu/data/menu_repository.dart';
import 'package:flutter_course/src/features/menu/models/drink_model.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';

sealed class MenuData {
  static List<DrinkModel>? drink_db_example;
  static List<SectionModel>? section_db_example;
  static List<String> section_strings_db_example = [];

  static Future<void> initialData() async {
    drink_db_example = await MenuProductRepository.getProductsList();
    section_db_example = await MenuProductRepository.getSectionList();
    section_strings_db_example = [
      for (SectionModel section in section_db_example!) section.slug,
    ];
  }
}

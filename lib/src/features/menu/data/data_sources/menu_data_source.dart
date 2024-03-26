
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

  // static List<DrinkModel> drink_db_example = [
  //    DrinkModel(
  //       img: 'lib/src/assets/images/example_image.png',
  //       name: 'Drink1',
  //       price: PriceModel(
  //         price: '516435',
  //         currency: 'RUB'
  //       ),
  //       description: 'dsffsd',
  //       section: section_db_example[0]
  //   ),
  // ];
  //
  //
  // static List<SectionModel> section_db_example = [
  //   SectionModel(id: 0, slug: 'Черный кофе'),
  //   // SectionModel(title: 'Кофе с молоком', drinks: drink_db_example),
  //   // SectionModel(title: 'Чай', drinks: drink_db_example),
  //   // SectionModel(title: 'Алкоголь', drinks: drink_db_example),
  //   // SectionModel(title: 'Лимонад', drinks: drink_db_example),
  // ];

  // static List<String> section_strings_db_example = [
  //   'Черный кофе',
  //   'Кофе с молоком',
  //   'Чай',
  //   'Алкоголь',
  //   'Лимонад'
  // ];

}

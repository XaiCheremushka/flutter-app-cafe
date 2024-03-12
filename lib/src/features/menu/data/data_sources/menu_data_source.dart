
import 'package:flutter_course/src/features/menu/models/drink_model.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';
import 'package:flutter_course/src/theme/image_sources.dart';

sealed class MenuData {

  static List<DrinkModel> drink_db_example = [
    const DrinkModel(
        img: 'lib/src/assets/images/example_image.jpg',
        name: 'Drink1',
        cost: '150 руб'
    ),

    const DrinkModel(
        img: 'lib/src/assets/images/example_image.jpg',
        name: 'Drink2',
        cost: '150 руб'
    ),

    const DrinkModel(
        img: 'lib/src/assets/images/example_image.jpg',
        name: 'Drink3',
        cost: '150 руб'
    ),
  ];


  static List<SectionModel> section_db_example = [
    SectionModel(title: 'Черный кофе', drinks: drink_db_example),
    SectionModel(title: 'Кофе с молоком', drinks: drink_db_example),
    SectionModel(title: 'Чай', drinks: drink_db_example),
  ];

  static List<String> section_strings_db_example = [
    'Черный кофе',
    'Кофе с молоком',
    'Чай',
  ];

}

import 'package:flutter_course/src/features/menu/models/price_model.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';

class DrinkModel {
  final int id;
  final String img;
  final String name;
  final String description;
  final SectionModel section;
  final PriceModel price;

  const DrinkModel({
    required this.id,
    required this.img,
    required this.name,
    required this.description,
    required this.section,
    required this.price,
  });
}
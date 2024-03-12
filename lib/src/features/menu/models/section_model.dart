import 'package:flutter_course/src/features/menu/models/drink_model.dart';

class SectionModel {
  final String title;
  final List<DrinkModel> drinks;

  const SectionModel({
    required this.title,
    required this.drinks,
  });
}
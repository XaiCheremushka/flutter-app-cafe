
import 'package:flutter_course/src/theme/image_sources.dart';

sealed class MenuData {
  static const sections = ['Черный кофе', 'Кофе с молоком', 'Чай'];
  static const products = [['Арабика', 'Робуста'], ['Капучино', 'Латтэ'], ['Зеленый', 'Черный']];
  static const productImages = [ImageSources.coffeeIcon, ImageSources.coffeeWithMilk, ImageSources.teaIcon];
  static const productsCost = [['158', '120'], ['200', '660'], ['425', '111']];
}
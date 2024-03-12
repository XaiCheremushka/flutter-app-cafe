import 'package:flutter/material.dart';

import 'package:flutter_course/src/features/menu/models/drink_model.dart';

import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';

class DrinkCard extends StatefulWidget {
  const DrinkCard({super.key, required this.data});

  final DrinkModel data;

  @override
  State<DrinkCard> createState() => _DrinkCardState();
}

class _DrinkCardState extends State<DrinkCard> {
  int _counter = 0;

  void _incrementCounter() {
    if(_counter < 10)
      setState(() {
        _counter++;
      });
  }
  void _decrementCounter() {
    if(_counter > 0)
      setState(() {
        _counter--;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 196,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(widget.data.img), // Возвращаем картинку напитка
            height: 100,
            errorBuilder:
                (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Image(
                    image: AssetImage('lib/src/assets/images/outdata_image.jpg'),
                    height: 100
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              widget.data.name, // Возвращаем имя напитка
              style: TextStyles.subtitle,
            ),
          ),
          SizedBox(
            height: 24,
            width: 116,
            child: _counter == 0 ?
                TextButton(
                  onPressed: _incrementCounter,
                  style: ButtonStyles.button_style,
                  child: Text(
                    widget.data.cost,
                    style: TextStyles.price,
                  ),
                )
                :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 24,
                      child: TextButton(
                        onPressed: _decrementCounter,
                        style: ButtonStyles.button_style,
                        child: const Text(
                          '-',
                          style: TextStyles.priceChange,
                        ),
                      ),
                    ),
                    Container(
                        width: 52,
                        height: 24,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '$_counter',
                          style: TextStyles.price,
                        )
                    ),
                    SizedBox(
                      width: 24,
                      child: TextButton(
                        onPressed: _incrementCounter,
                        style: _counter == 10
                            ? ButtonStyles.unactive_button_style
                            : ButtonStyles.button_style,
                        child: const Text(
                          '+',
                          style: TextStyles.priceChange,
                        ),
                      ),
                    ),
                  ],
                ),
          )
        ],
      ),
    );
  }
}

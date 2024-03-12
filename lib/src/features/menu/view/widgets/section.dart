import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drink_card.dart';

class Section extends StatelessWidget {
  const Section({super.key, required this.data});

  final SectionModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              data.title,
              style: TextStyles.title,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => DrinkCard(data: data.drinks[index]),
                separatorBuilder: (context, _) => SizedBox(width: 16),
                itemCount: data.drinks.length
            ),
          )
        ],
      ),
    );
  }
}

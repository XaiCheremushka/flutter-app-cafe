import 'package:flutter/material.dart';
import 'package:flutter_course/src/features/menu/data/data_sources/menu_data_source.dart';
import 'package:flutter_course/src/features/menu/data/styles.dart';
import 'package:flutter_course/src/features/menu/models/drink_model.dart';
import 'package:flutter_course/src/features/menu/models/section_model.dart';
import 'package:flutter_course/src/features/menu/view/widgets/drink_card.dart';

class Section extends StatefulWidget {
  const Section({super.key, required this.data});

  final SectionModel data;

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  late final List<DrinkModel> _drinks = [for (DrinkModel item in MenuData.drink_db_example!) if (item.section.id == widget.data.id) item];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.data.slug,
              style: TextStyles.title,
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => DrinkCard(data: _drinks[index]),
                separatorBuilder: (context, _) => SizedBox(width: 16),
                itemCount: _drinks.length
            ),
          )
        ],
      ),
    );
  }
}

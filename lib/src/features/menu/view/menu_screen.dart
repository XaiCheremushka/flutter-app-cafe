import 'package:flutter/material.dart';

import 'package:flutter_course/src/features/menu/data/styles.dart';
import 'package:flutter_course/src/features/menu/view/widgets/section.dart';
import 'package:flutter_course/src/theme/app_colors.dart';
import 'package:flutter_course/src/features/menu/data/data_sources/menu_data_source.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: Colors.transparent,
          title: SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(width: 16),
              itemCount: MenuData.section_strings_db_example.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                      height: 32,
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          alignment: Alignment.center,
                          backgroundColor: AppColors.white,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        ),
                        child: Text(
                          MenuData.section_strings_db_example[index],
                          style: TextStyles.chip,
                        ),
                      ),
                    );
              },

            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListView.separated(
          separatorBuilder: (context, _) => SizedBox(height: 16),
          itemCount: MenuData.section_db_example.length,
          itemBuilder: (context, index) => Section(
            data: MenuData.section_db_example[index],
            key: ValueKey(MenuData.section_db_example[index].title),
          ),
        ),
      ),
    );
  }
}
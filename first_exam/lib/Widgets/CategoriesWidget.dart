
import 'package:first_exam/Models/Category.dart';
import 'package:first_exam/Widgets/CategoryCellWidget.dart';
import 'package:first_exam/data/ResImage.dart';
import 'package:first_exam/data/ResString.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatelessWidget {
  final mBiggerFont = const TextStyle(fontSize: 18.0);
  List<CategoryCellWidget> children = new List();
  @override
  Widget build(BuildContext context) {
    return new ListView(children: generateChildrenList());
  }

  List<CategoryCellWidget> generateChildrenList() {
    List<CategoryCellWidget> ls = generateCategories().map((item) {
      return new CategoryCellWidget(category: item,);
    }).toList();
    return ls;
  }

  List<Category> generateCategories() {
    List<Category> ls = new List();
    ls.add(new Category(title: VAL_LENGTH, iconUrl: IMG_MEASURE));
    ls.add(new Category(title: VAL_AREA, iconUrl: IMG_AREA));
    ls.add(new Category(title: VAL_VOLUME, iconUrl: IMG_VOLUME));
    ls.add(new Category(title: VAL_MASS, iconUrl: IMG_SCALE));
    ls.add(new Category(title: VAL_TIME, iconUrl: IMG_TIME));
    ls.add(new Category(title: VAL_DIGITAL_STORAGE, iconUrl: IMG_STORAGE));
    ls.add(new Category(title: VAL_ENERGY, iconUrl: IMG_ENERGY));
    return ls;
  }
}
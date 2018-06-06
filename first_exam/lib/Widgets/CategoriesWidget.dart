
import 'package:first_exam/Models/Category.dart';
import 'package:first_exam/Widgets/CategoryCellWidget.dart';
import 'package:first_exam/data/ResImage.dart';
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
    ls.add(new Category(title: "Length", iconUrl: ResImage.IMG_MEASURE));
    ls.add(new Category(title: "Arrea", iconUrl: ResImage.IMG_AREA));
    ls.add(new Category(title: "Volume", iconUrl: ResImage.IMG_VOLUME));
    ls.add(new Category(title: "Mass", iconUrl: ResImage.IMG_SCALE));
    ls.add(new Category(title: "Time", iconUrl: ResImage.IMG_TIME));
    ls.add(new Category(title: "Digital Storage", iconUrl: ResImage.IMG_STORAGE));
    ls.add(new Category(title: "Energy", iconUrl: ResImage.IMG_ENERGY));
    ls.add(new Category(title: "Currency", iconUrl: ResImage.IMG_CURRENCY));
    return ls;
  }
}
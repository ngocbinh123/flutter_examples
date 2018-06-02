
import 'package:first_exam/Models/Category.dart';
import 'package:first_exam/Widgets/CategoryCellWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoriesWidget extends StatelessWidget {
  final mBiggerFont = const TextStyle(fontSize: 18.0);
  List<CategoryCellWidget> children = new List();
  @override
  Widget build(BuildContext context) {
    return new ListView(children: generateChildrenList());;
  }

  List<CategoryCellWidget> generateChildrenList() {
    List<CategoryCellWidget> ls = generateCategories().map((item) {
      return new CategoryCellWidget(item);
    }).toList();
    return ls;
  }

  List<Category> generateCategories() {
    List<Category> ls = new List();
    ls.add(new Category("Length", Icons.category));
    ls.add(new Category("Arrea", Icons.category));
    ls.add(new Category("Volume", Icons.category));
    ls.add(new Category("Mass", Icons.category));
    ls.add(new Category("Time", Icons.category));
    ls.add(new Category("Digital Storage", Icons.category));
    ls.add(new Category("Energy", Icons.category));
    ls.add(new Category("Currency", Icons.category));
    return ls;
  }
}
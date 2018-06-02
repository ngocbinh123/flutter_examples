
import 'package:first_exam/Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// init category row to show on menu
class CategoryCellWidget extends StatefulWidget {
  Category category;
  CategoryCellWidget(this.category);
  @override
  createState() => new CategoryCellWidgetState(category);
}

class CategoryCellWidgetState extends State<CategoryCellWidget> {
  Category category;
  bool isSelected = false;

//  constructor
  CategoryCellWidgetState(this.category);

  @override
  Widget build(BuildContext context) => new ListTile(
      title: new Text(category.name),
      leading: new Icon(category.icon),
      onTap: this.onTab);

  void onTab() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}
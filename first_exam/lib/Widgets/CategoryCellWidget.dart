
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
  double size = 25.0;
//  constructor
  CategoryCellWidgetState(this.category);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(category.title),
        leading: Image.asset(category.iconUrl, fit: BoxFit.contain, width: size, height: size,),
        onTap: this.onTab);
  }

  void onTab() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}
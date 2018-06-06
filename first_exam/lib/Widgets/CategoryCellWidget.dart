
import 'package:first_exam/Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// init category row to show on menu
class CategoryCellWidget extends StatefulWidget {
  Category category;
  bool isSelected = false;
  GestureTapCallback onTabListener;

  CategoryCellWidget({Key key, this.category, this.isSelected, this.onTabListener});
  @override
  createState() => new CategoryCellWidgetState(category: category, isSelected: isSelected, onTabListener: this.onTabListener);
}

class CategoryCellWidgetState extends State<CategoryCellWidget> {
  Category category;
  bool isSelected = false;
  double size = 25.0;
  GestureTapCallback onTabListener;
//  constructor
  CategoryCellWidgetState({Key key, this.category, this.isSelected, this.onTabListener});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(category.title),
        leading: Image.asset(category.iconUrl, fit: BoxFit.contain, width: size, height: size,),
        selected: this.isSelected,
        onTap: this.onTabListener);
  }

  void onTab() {
    setState(() => isSelected = !isSelected);
//    Navigator.of(context).pop();
  }
}
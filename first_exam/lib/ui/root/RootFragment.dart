import 'package:first_exam/Models/Category.dart';
import 'package:first_exam/Widgets/CategoryCellWidget.dart';
import 'package:first_exam/data/ResDimen.dart';
import 'package:first_exam/data/ResImage.dart';
import 'package:first_exam/ui/subRootTabs/SubRootTabFragment.dart';
import 'package:flutter/material.dart';

class RootFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RootFragmentState();
}

class RootFragmentState extends State<RootFragment> {
  int mSelectedDrawerIndex = 0;
  final List<Category> mCategories = [
    new Category(title: "Length", iconUrl: ResImage.IMG_MEASURE),
    new Category(title: "Arrea", iconUrl: ResImage.IMG_AREA),
    new Category(title: "Volume", iconUrl: ResImage.IMG_VOLUME),
    new Category(title: "Mass", iconUrl: ResImage.IMG_SCALE),
    new Category(title: "Time", iconUrl: ResImage.IMG_TIME),
    new Category(title: "Digital Storage", iconUrl: ResImage.IMG_STORAGE),
    new Category(title: "Energy", iconUrl: ResImage.IMG_ENERGY)
  ];

  @override
  Widget build(BuildContext context) {
    var appbar = new AppBar(title: new Text(mCategories[mSelectedDrawerIndex].title),);
    return new Scaffold(appBar: appbar,
    drawer: getNavigationDrawer(),
    body: _getDrawerItemWidget(mSelectedDrawerIndex),);
  }

  Drawer getNavigationDrawer() {
    return new Drawer(
      child: new Column(children: <Widget>[getHeader(), new Column(children: generateChildrenList(),)],),
    );
  }

  _getDrawerItemWidget(int pos) {
    return new SubRootTabFragment(index: pos,);
  }

  _onSelectItem(int index) {
    setState(() => mSelectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  UserAccountsDrawerHeader getHeader() {
    final accountName = new Text("Nguyen Ngoc Binh", style: new TextStyle(fontSize: ResDimen.HEADER_ACCOUNT_NAME, fontWeight: FontWeight.bold),);
    final accountEmail =  new Text("nnbinh0301@gmail.com", style: new TextStyle(fontSize: ResDimen.HEADER_ACCOUNT_EMAIL));
    final currentAvatar = new Icon(Icons.supervised_user_circle, size: ResDimen.HEADER_ACCOUNT_AVATAR, color: Colors.white,);
    return new UserAccountsDrawerHeader(accountName: accountName, accountEmail: accountEmail, currentAccountPicture: currentAvatar);
  }

  List<CategoryCellWidget> generateChildrenList() {
    List<CategoryCellWidget> drawerOptions = [];
    for(int i =0; i < mCategories.length; i++) {
      var cell = new CategoryCellWidget(category: mCategories[i], isSelected: i == mSelectedDrawerIndex,
        onTabListener: ()=> _onSelectItem(i),);
      drawerOptions.add(cell);
    }

    return drawerOptions;
  }
}
import 'package:first_exam/Models/Category.dart';
import 'package:first_exam/Widgets/CategoryCellWidget.dart';
import 'package:first_exam/data/ResDimen.dart';
import 'package:first_exam/data/ResImage.dart';
import 'package:first_exam/data/ResString.dart';
import 'package:first_exam/ui/camera/CameraFragment.dart';
import 'package:first_exam/ui/checkBattery/CheckBatteryFragment.dart';
import 'package:first_exam/ui/energy/EnergyFragment.dart';
import 'package:first_exam/ui/gallery/GalleryFragment.dart';
import 'package:first_exam/ui/subRootTabs/SubRootTabFragment.dart';
import 'package:flutter/material.dart';

class RootFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RootFragmentState();
}

class RootFragmentState extends State<RootFragment> {
  int mSelectedDrawerIndex = 0;
  final List<Category> mCategories = [
    new Category(title: VAL_LENGTH, iconUrl: IMG_MEASURE),
    new Category(title: VAL_AREA, iconUrl: IMG_AREA),
    new Category(title: VAL_VOLUME, iconUrl: IMG_VOLUME),
    new Category(title: VAL_MASS, iconUrl: IMG_SCALE),
    new Category(title: VAL_TIME, iconUrl: IMG_TIME),
    new Category(title: VAL_DIGITAL_STORAGE, iconUrl: IMG_STORAGE),
    new Category(title: VAL_ENERGY, iconUrl: IMG_ENERGY),
    new Category(title: VAL_CHECK_BATTERY, iconUrl: IMG_BATTERY_MEDIUM),
    new Category(title: VAL_CAMERA, iconUrl: IMG_CAMERA),
    new Category(title: VAL_GALLERY, iconUrl: IMG_GALLERY)
  ];

  @override
  Widget build(BuildContext context) {
    var appbar = new AppBar(title: new Text(mCategories[mSelectedDrawerIndex].title),);
    return new Scaffold(appBar: appbar,
    drawer: getNavigationDrawer(),
    body: getDrawerItemWidget(mSelectedDrawerIndex),);
  }

  Drawer getNavigationDrawer() {
    return new Drawer(
      child: new Column(children: <Widget>[getHeader(), new Column(children: generateChildrenList(),)]),
    );
  }

  getDrawerItemWidget(int pos) {
    switch(pos) {
      case 0: return new CheckBatteryFragment();
      case 6: return new EnergyFragment();
      case 7: return new CheckBatteryFragment();
      case 8: return new CameraFragment();
      case 9: return new GalleryFragment();
      default: return new SubRootTabFragment(index: pos,);
    }
  }

  onSelectItem(int index) {
    setState(() => mSelectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  UserAccountsDrawerHeader getHeader() {
    final accountName = new Text("Nguyen Ngoc Binh", style: new TextStyle(fontSize: HEADER_ACCOUNT_NAME, fontWeight: FontWeight.bold),);
    final accountEmail =  new Text("nnbinh0301@gmail.com", style: new TextStyle(fontSize: HEADER_ACCOUNT_EMAIL));
    final currentAvatar = new Icon(Icons.supervised_user_circle, size: HEADER_ACCOUNT_AVATAR, color: Colors.white,);
    return new UserAccountsDrawerHeader(accountName: accountName, accountEmail: accountEmail, currentAccountPicture: currentAvatar);
  }

  List<CategoryCellWidget> generateChildrenList() {
    List<CategoryCellWidget> drawerOptions = [];
    for(int i =0; i < mCategories.length; i++) {
      var cell = new CategoryCellWidget(category: mCategories[i], isSelected: i == mSelectedDrawerIndex,
        onTabListener: ()=> onSelectItem(i),);
      drawerOptions.add(cell);
    }

    return drawerOptions;
  }
}
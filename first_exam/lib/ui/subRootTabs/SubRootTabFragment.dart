import 'package:flutter/material.dart';

class SubRootTabFragment extends StatelessWidget {
  int index = 0;
  SubRootTabFragment({Key key, this.index});
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Hello Fragment $index"),
    );
  }

}
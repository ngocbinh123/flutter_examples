import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowImageFragment extends StatelessWidget {
  File image;

  static void start(BuildContext context,File image) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> ShowImageFragment(image)));
  }
  
  ShowImageFragment(this.image);

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: image == null ? new Text("No image to show") : new Image.file(image),
    );
  }

}
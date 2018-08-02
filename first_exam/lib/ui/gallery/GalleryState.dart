import 'dart:io';

import 'package:first_exam/ui/gallery/GalleryFragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GalleryState extends State<GalleryFragment> {
  File image;
  GalleryState({Key key, this.image});

  @override
  Widget build(BuildContext context) {
//    return new Text("Gallery screen");
    return new Scaffold(
      appBar: null,
      body: new Container(
        child: image == null ? new Text("No Image to show") : new Image.file(image),
      ),
    );
  }

}
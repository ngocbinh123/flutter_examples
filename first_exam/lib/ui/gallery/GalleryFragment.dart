import 'dart:io';

import 'package:first_exam/ui/gallery/GalleryState.dart';
import 'package:flutter/widgets.dart';

class GalleryFragment extends StatefulWidget {
  File image;

  GalleryFragment({Key key, this.image});

  @override
  State<StatefulWidget> createState() => new GalleryState(image: image);
}
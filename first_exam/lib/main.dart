import 'package:first_exam/ui/root/RootFragment.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false,
    home: new RootFragment(),);
  }
}

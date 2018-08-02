
import 'dart:async';

import 'package:first_exam/ui/checkBattery/CheckBatteryFragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CheckBatteryState extends State<CheckBatteryFragment> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }

  static const platform = const MethodChannel('samples.flutter.io/battery');
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

}
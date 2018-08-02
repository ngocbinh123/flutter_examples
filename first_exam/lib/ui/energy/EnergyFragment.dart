
import 'package:flutter/material.dart';

class EnergyFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EnergyFragmentState();
}

class EnergyFragmentState extends State<EnergyFragment> {
  var mFromController = new TextEditingController();
  var mToController = new TextEditingController();
  List<String> mInputTypes = ["Joule", "Kilojoule", "Gram calorie", "Kolocalorie (Calorie)", "Watt hour", "Brtish thermal unit", "US therm"];

  String mSelectedFromTypeValue;
  String mSelectedToTypeValue;

  Widget mBtnDropFrom;
  Widget mBtnDropTo;
  @override
  Widget build(BuildContext context) {
    Widget btnConvert = new IconButton(
        icon: new Icon(Icons.arrow_downward, size: 46.0,),
        onPressed: () {
          setState(() {
            if(mFromController.value.text.isEmpty) {
              showDlg(context, "Please type number in Input.");
            }else if(mSelectedFromTypeValue == null) {
              showDlg(context, "Please select input type.");
            }else if(mSelectedToTypeValue == null) {
              showDlg(context, "Please select output type.");
            }else {
              var result = int.parse(mFromController.value.text)~/2;
              mToController.value = TextEditingValue(text: result.toString());
            }
      });
    });

    mBtnDropFrom = createTypesDropdown(mSelectedFromTypeValue, (value) {
      setState(() {
        mSelectedFromTypeValue = value;
      });
    });

    mBtnDropTo = createTypesDropdown(mSelectedToTypeValue, (value) {
      setState(() {
        mSelectedToTypeValue = value;
      });
    });

    TextField fromInput = createNumberInput("Input", mFromController);
    TextField toInput = createNumberInput('Output', mToController);
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[fromInput, mBtnDropFrom, new Container(
          margin: EdgeInsets.all(16.0),
          child: btnConvert,
        ), toInput, mBtnDropTo],
      ),
    );
  }

  void showDlg(BuildContext context, String message) {
    var btnClose = new FlatButton(onPressed: () {
      Navigator.of(context).pop();
    }, child: new Text("Close",
        style: TextStyle(color: Colors.blue, fontSize: 16.0)));

    var dlg = new AlertDialog(
      title: new Text("Warning", style: TextStyle(color: Colors.yellow, fontSize: 30.0, fontWeight: FontWeight.bold),),
      content: new Text(message, style: TextStyle(fontSize: 20.0),),
      actions: <Widget>[btnClose],
    );

    showDialog(context: context, child: dlg);
  }

  Widget createNumberInput(String labelText, TextEditingController controller) {
    TextField input = new TextField(
      style: Theme.of(context).textTheme.display1,
      decoration: new InputDecoration(labelText: labelText),
      keyboardType: TextInputType.number,
      controller: controller,
    );
    return input;
  }

  Widget createTypesDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    var menuItems = mInputTypes.map((String value) {
      Row row = new Row(children: <Widget>[
        new Icon(Icons.home),
        new Text(value)],);
      return new DropdownMenuItem(value: value, child: row);
    }).toList();

    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: BoxDecoration(
        // This sets the color of the [DropdownButton] itself
        border: Border.all(
          color: Colors.grey[400],
          width: 1.0,),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          padding: EdgeInsets.all(8.0),
          alignedDropdown: true,
          child: DropdownButton(
            hint: new Text("Select"),
            value: currentValue,
            items: menuItems,
            onChanged: onChanged,
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ),
    );
  }
}
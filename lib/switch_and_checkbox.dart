import 'package:flutter/material.dart';

/// 单选开关和复选框
class SwitchAndCheckBoxRoute extends StatefulWidget{
  @override
  _SwitchAndCheckBoxRouteState createState() => new _SwitchAndCheckBoxRouteState();
}

class _SwitchAndCheckBoxRouteState extends State<SwitchAndCheckBoxRoute>{
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value){
            setState(() {
              _switchSelected = value;
            });
        }),
        Checkbox(value: _checkboxSelected,activeColor: Colors.red, onChanged: (value){
          setState(() {
            _checkboxSelected = value;
          },);
        })
      ],
    );
  }
}
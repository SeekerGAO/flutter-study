import 'package:flutter/material.dart';

/// 父Widget管理子Widget的状态
/// 页面颜色切换
class TapBoxB extends StatefulWidget{
  @override
  _TapBoxBState createState() => new _TapBoxBState();
}

class _TapBoxBState extends State<TapBoxB>{
  bool _active = false;

  // 点击改变状态
  void _handleTapChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapBoxBSon(
        active: _active,
        onChanged: _handleTapChanged,
      )
    );
  }
}

class TapBoxBSon extends StatelessWidget{
  TapBoxBSon({
    Key key,
    this.active: false,
    @required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  // 点击改变状态
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
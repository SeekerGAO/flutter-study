import 'package:flutter/material.dart';

/// 混合状态管理
class TapBoxC extends StatefulWidget{
  @override
  _TapBoxCState createState() => new _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC>{
  bool _active = false;

  // 点击改变状态
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      child: new TapBoxCSon(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapBoxCSon extends StatefulWidget{
  TapBoxCSon({
    Key key,
    this.active: false,
    @required this.onChanged,
  }) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCSonState createState() => new _TapBoxCSonState();
}

/// 在按下时添加绿色边框，当抬起时，取消高亮
class _TapBoxCSonState extends State<TapBoxCSon>{
  bool _highlight = false;

  // 手指按下
  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  // 手指抬起
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }

  // 取消点击
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  // 点击改变
  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? "Active" : "Inactive",
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ?
            new Border.all(
              color: Colors.teal[700],
              width: 10.0
          ) : null,
        ),
      ),
    );
  }
}
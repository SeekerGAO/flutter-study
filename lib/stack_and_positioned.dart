import 'package:flutter/material.dart';

class StackAndPositionedRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局（Stack、Positioned）"),
      ),
      body: Container(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                left: 18.0,
                child: Text("I am Flutter"),
              ),
              Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                color: Colors.red,
              ),
              Positioned(
                top: 18.0,
                child: Text("Your friend"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
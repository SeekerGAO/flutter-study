import 'package:flutter/material.dart';

class AlignRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("对齐与相对定位（Align）"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 120.0,
                  color: Colors.blue[50],
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FlutterLogo(
                      size: 60,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:  Container(
                    color: Colors.blue[50],
                    child:  Align(
                      widthFactor: 2,
                      heightFactor: 2,
                      alignment: Alignment.topRight,
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:  Container(
                    color: Colors.blue[50],
                    child:  Align(
                      widthFactor: 2,
                      heightFactor: 2,
                      alignment: Alignment(2,0.0),
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:  Container(
                    height: 120.0,
                    width: 120.0,
                    color: Colors.blue[50],
                    child: Align(
                      alignment: FractionalOffset(0.2, 0.6),
                      child: FlutterLogo(
                        size: 60,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:  Container(
                    height: 120.0,
                    width: 120.0,
                    color: Colors.blue[50],
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Center(
                        child: Text("xxx"),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child:  Container(
                    height: 120.0,
                    width: 120.0,
                    color: Colors.blue[50],
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Center(
                        widthFactor: 1,
                        heightFactor: 1,
                        child: Text("xxx"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
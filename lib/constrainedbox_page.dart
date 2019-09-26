import 'package:flutter/material.dart';

class ConstrainedBoxRoute extends StatelessWidget {

  final redBox=DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("尺寸限制类容器（ConstrainedBox等）"),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text("最小高度为50，宽度尽可能大的红色容器"),
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                ),
                child: Container(
                    height: 5.0,
                    child: redBox
                ),
              ),

              Padding(
                child: Text("给子元素指定固定的宽高"),
                padding: const EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: redBox
              ),

              Padding(
                child: Text(" 多重限制"),
                padding: const EdgeInsets.only(top: 20.0),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                    child: redBox,
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                    child: redBox,
                  )
              ),

              Padding(
                child: Text("UnconstrainedBox"),
                padding: const EdgeInsets.only(top: 20.0),
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                  child: UnconstrainedBox( //“去除”父级限制
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                      child: redBox,
                    ),
                  )
              ),
            ],
          ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// 图片与Icon
class ImageAndIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var img = AssetImage("assets/images/avatar.png");

    return Scaffold(
      appBar: AppBar(
        title: Text("图片及ICON"),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: <Image>[
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                height: 50,
                width: 50.0,
                fit: BoxFit.contain,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitWidth,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.fitHeight,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 50.0,
                fit: BoxFit.scaleDown,
              ),
              Image(
                image: img,
                height: 50.0,
                width: 100.0,
                fit: BoxFit.none,
              ),
              Image(
                image: img,
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,
                fit: BoxFit.fill,
              ),
              Image(
                image: img,
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeatY ,
                fit: BoxFit.none,
              )
            ].map((e){
              return Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                  ),
                  Text(e.fit.toString()),
                  Icon(Icons.ac_unit, color: Colors.blue,),
                  Icon(Icons.access_alarm, color: Colors.pink,),
                  Icon(Icons.access_time, color: Colors.lightGreen,),

                  Icon(MyIcon.qq, color: Colors.blue,),
                  Icon(MyIcon.we_chat, color: Colors.green,),
                ],
              );
            }).toList()
          ),
      ),
    );
  }
}

/// 自定义Icon类
/// 使用iconfont字体
/// 查看iconfont.css，将 \替换成0x即可得到对应的 codePoint
//.icon-qq-copy:before {
//  content: "\e67f";
//}
class MyIcon {
  // qq图标
  static const IconData qq = const IconData(
      0xe63c,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );

  // 微信图标
  static const IconData we_chat = const IconData(
      0xe67f,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
}
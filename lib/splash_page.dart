import 'package:flutter/material.dart';

/// 启动页面
class SplashPage extends StatefulWidget{
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage>{
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Builder(builder: (context){
      return Container(
        child: Image(image: AssetImage("assets/images/ic_launcher.png"), fit: BoxFit.fill,),
      );
    });
  }
}
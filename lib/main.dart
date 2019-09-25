import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'counter_page.dart';

import 'tapboxA.dart';
import 'tapboxB.dart';
import 'tapboxC.dart';

import 'image_and_icon.dart';

import 'switch_and_checkbox.dart';

import 'input_and_form.dart';

import 'progress_indicator.dart';

import 'row_and_column.dart';

import 'flex_layout_page.dart';

import 'wrap_and_flow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      // 注册路由表
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), // 注册首页路由
        "new_page": (context) => NewRoute(),
        "open_tip_page": (context) => RouterTestRoute(),
        "tip_page": (context) => TipRoute(
              text: '',
            ),
        "echo_page": (context) => EchoRoute(),

        "context_test": (context) => ContextTest(),

        "context_state": (context) => ContextState(),

        "tap_box_a": (context) => TapBoxA(),

        "tap_box_b": (context) => TapBoxB(),

        "tap_box_c": (context) => TapBoxC(),

        "image_and_icon": (context) => ImageAndIcon(),

        "input_and_form":(context) => InputAndFormRoute(),

        "progress_indicator": (context) => ProgressIndicatorRoute(),

        "row_and_column":(context) => RowAndCoulmnRoute(),

        "flex_layout": (context) => FlexLayoutRoute(),

        "wrap_and_flow": (context) => WrapAndFlowRoute()
      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// 新增路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

/// 路由传值
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接受一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/// 路由传值页面
class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: RaisedButton(
        onPressed: () async {
          // 打开TipRoute，并等待返回结果
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return TipRoute(
              // 路由参数
              text: "我是提示xxx",
            );
          }));

          print("路由返回值：$result");
        },
        child: Text("打开提示页"),
      ),
    );
  }
}

/// 命名路由参数传递
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由参数传递"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}

/// 新增生成随机字符串
class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();

    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: new Text("随机生成的字符串：" + wordPair.toString()),
    );
  }
}

/// StatelessWidget
class EchoString extends StatelessWidget {
  const EchoString({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey,
  }) : super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

/// Context
class ContextTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Context Test"),
      ),
      body: Container(
        child: Center(
          child: Builder(builder: (context){
            // 在Widget树上查找最近的父级`Scaffold`widget
            Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
            // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
            return (scaffold.appBar as AppBar).title;
          }),
        ),
      ),
    );
  }
}

/// 在Widget树中获取State对象
/// 通过Context获取
class ContextState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar( 
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context){
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              // StatefulWidget的状态是不希望暴露
              // ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              // StatefulWidget的状态是希望暴露
              ScaffoldState _state = Scaffold.of(context);
              // 调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}

/// 使用字体
class TextFonts extends StatelessWidget{

   final textStyle = const TextStyle(
    fontFamily: 'LiuJianMaoCao'
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      "This is Text Style",
      style: textStyle,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () {
                  // 导航到新路由
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context){
//                      return NewRoute();
//                    })
//                );
                  Navigator.pushNamed(context, "new_page");
                },
              ),
              FlatButton(
                child: Text("Route send value"),
                textColor: Colors.blue,
                onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return RouterTestRoute();
//                }));

                  Navigator.pushNamed(context, "open_tip_page");
                },
              ),
              FlatButton(
                child: Text("Route echo value"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed("echo_page", arguments: "我是命名路由参数");
                },
              ),

              RandomWordsWidget(),

              EchoString(text: "This is echo string",),

              FlatButton(
                child: Text("Context Test"),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "context_test");
                },
              ),

//            CounterWidget(),

              FlatButton(
                child: Text("Context State"),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "context_state");
                },
              ),

              FlatButton(
                child: Text("TapBoxA"),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "tap_box_a");
                },
              ),

              FlatButton(
                child: Text("TapBoxB"),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "tap_box_b");
                },
              ),

              FlatButton(
                child: Text("TapBoxC",style: new TextStyle(fontFamily: 'ZCOOLKuaiLe'),),
                textColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, "tap_box_c");
                },
              ),

              TextFonts(),

              FlatButton(
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: (){},
              ),
              RaisedButton(
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: (){},
              ),

              RaisedButton(
                child: Text("Go To ImageAndIcon Page"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: (){
                  Navigator.pushNamed(context, "image_and_icon");
                },
              ),

              SwitchAndCheckBoxRoute(),

              RaisedButton(
                child: Text("Go To InputAndForm Page"),
                color: Colors.blue,
                colorBrightness: Brightness.dark,
                onPressed: (){
                  Navigator.pushNamed(context, "input_and_form");
                },
              ),

              FlatButton(
                child: Text("Go To ProgressIndicator Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "progress_indicator");
                },
              ),

              FlatButton(
                child: Text("Go To RowAndColumn Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "row_and_column");
                },
              ),

              FlatButton(
                child: Text("Go To FlexLayout Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "flex_layout");
                },
              ),

              FlatButton(
                child: Text("Go To WrapAndFlow Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "wrap_and_flow");
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

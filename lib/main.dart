import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math' as math;
import 'widgets/page_scaffold.dart';
import 'routes/index.dart';

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

import 'stack_and_positioned.dart';

import 'align_page.dart';

import 'padding_page.dart';

import 'constrainedbox_page.dart';

import 'complete_page.dart';

import 'clip_page.dart';

import 'singlechildscrollview_page.dart';

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

        "input_and_form": (context) => InputAndFormRoute(),

        "progress_indicator": (context) => ProgressIndicatorRoute(),

        "row_and_column": (context) => RowAndCoulmnRoute(),

        "flex_layout": (context) => FlexLayoutRoute(),

        "wrap_and_flow": (context) => WrapAndFlowRoute(),

        "stack_and_positioned": (context) => StackAndPositionedRoute(),

        "align_page": (context) => AlignRoute(),

        "padding_page": (context) => PaddingRoute(),

        "constrainedbox_page": (context) => ConstrainedBoxRoute(),

        "complete_page": (context) => CompleteRoute(),

        "clip_page": (context) => ClipRoute(),

        "singlechildscrollview_page": (context) => SingleChildScrollViewRoute(),
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
class ContextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Context Test"),
      ),
      body: Container(
        child: Center(
          child: Builder(builder: (context) {
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
class ContextState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
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
class TextFonts extends StatelessWidget {
  final textStyle = const TextStyle(fontFamily: 'LiuJianMaoCao');

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

  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
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
              ExpansionTile(
                title: Text("第七章：功能型组件"),
                children: _generateItem(context, [
                  PageInfo(
                      "导航返回拦截（WillPopScope）", (ctx) => WillPopScopeRoute()),
                  PageInfo(
                      "数据共享（InheritedWidget）", (ctx) => InheritedWidgetRoute()),
                  PageInfo("跨组件状态共享（Provider）", (ctx) => ProviderRoute()),
                  PageInfo("颜色和主题", (ctx) => ThemeRoute()),
                  PageInfo("异步UI更新（FutureBuilder、StreamBuilder）", (ctx) => FutureBuilderAndStreamBuilderRoute()),
                ]),
              ),

              ExpansionTile(
                title: Text("第十一章：文件操作与网络请求"),
                children: _generateItem(context, [
                  PageInfo("文件操作", (ctx) => FileOperationsRoute()),
                  PageInfo("通过HttpClient发起HTTP请求", (ctx) => HttpClientRoute()),
                  PageInfo("Http请求-Dio http库", (ctx) => DioHttpRoute()),
                ]),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20),
              ),

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

              EchoString(
                text: "This is echo string",
              ),

              FlatButton(
                child: Text("Context Test"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "context_test");
                },
              ),

//            CounterWidget(),

              FlatButton(
                child: Text("Context State"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "context_state");
                },
              ),

              FlatButton(
                child: Text("TapBoxA"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "tap_box_a");
                },
              ),

              FlatButton(
                child: Text("TapBoxB"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "tap_box_b");
                },
              ),

              FlatButton(
                child: Text(
                  "TapBoxC",
                  style: new TextStyle(fontFamily: 'ZCOOLKuaiLe'),
                ),
                textColor: Colors.blue,
                onPressed: () {
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text("Submit"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),

              RaisedButton(
                child: Text("Go To ImageAndIcon Page"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  Navigator.pushNamed(context, "image_and_icon");
                },
              ),

              SwitchAndCheckBoxRoute(),

              RaisedButton(
                child: Text("Go To InputAndForm Page"),
                color: Colors.blue,
                colorBrightness: Brightness.dark,
                onPressed: () {
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

              FlatButton(
                child: Text("Go To StackAndPisitioned Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "stack_and_positioned");
                },
              ),

              FlatButton(
                child: Text("Go To Align Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "align_page");
                },
              ),

              FlatButton(
                child: Text("Go To Padding Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "padding_page");
                },
              ),

              FlatButton(
                child: Text("Go To ConstrainedBox Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "constrainedbox_page");
                },
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.red, Colors.orange[700]]), //背景渐变
                        borderRadius: BorderRadius.circular(3.0), //3像素圆角
                        boxShadow: [
                          //阴影
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 4.0)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 80.0, vertical: 18.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Container(
                  color: Colors.black,
                  child: new Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                    transform: new Matrix4.skewY(0.4), //沿Y轴倾斜0.3弧度
                    child: new Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text('变换（Transform）!'),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.translate(
                    offset: Offset(-20.0, -5.0),
                    child: Text("平移"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Transform.rotate(
                    //旋转90度
                    angle: math.pi / 2,
                    child: Text("旋转"),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, //放大到1.5倍
                        child: Text("缩放"))),
              ),

              Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                          child: Transform.scale(
                              scale: 1.5, child: Text("Transform的变换是应用在绘制阶段"))),
                      Text(
                        "你好",
                        style: TextStyle(color: Colors.green, fontSize: 18.0),
                      )
                    ],
                  )),

              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      //将Transform.rotate换成RotatedBox
                      child: RotatedBox(
                        quarterTurns: 1, //旋转90度(1/4圈)
                        child: Text(
                            "RotatedBox是作用于layout阶段，所以子组件会旋转90度（而不只是绘制的内容"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Container(
                  margin: EdgeInsets.only(top: 50.0, left: 120.0), //容器外填充
                  constraints: BoxConstraints.tightFor(
                      width: 200.0, height: 150.0), //卡片大小
                  decoration: BoxDecoration(
                      //背景装饰
                      gradient: RadialGradient(
                          //背景径向渐变
                          colors: [Colors.red, Colors.orange],
                          center: Alignment.topLeft,
                          radius: .98),
                      boxShadow: [
                        //卡片阴影
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  transform: Matrix4.rotationZ(.2), //卡片倾斜变换
                  alignment: Alignment.center, //卡片内文字居中
                  child: Text(
                    //卡片文字
                    "卡片", style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                ),
              ),

              FlatButton(
                child: Text("Go To Complete Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "complete_page");
                },
              ),

              FlatButton(
                child: Text("Go To Clip Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "clip_page");
                },
              ),

              FlatButton(
                child: Text("Go To SingleChildScrollView Page"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, "singlechildscrollview_page");
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

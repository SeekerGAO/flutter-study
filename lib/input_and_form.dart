import 'package:flutter/material.dart';

class InputAndFormRoute extends StatefulWidget{
  @override
  _InputAndFormRouteState createState() => new _InputAndFormRouteState();
}

class _InputAndFormRouteState extends State<InputAndFormRoute>{

  // 定义controller获取输入框的值
  TextEditingController _usernameController = TextEditingController();

  // 密码通过onChange获取
  String _password = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框和表单"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(18),
              child: Text("登录输入框"),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名和邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
              controller: _usernameController,
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
              onChanged: (v){
                setState(() {
                  _password = v;
                });
              },
            ),

            Padding(
              padding: EdgeInsets.all(18),
              child:  Text("控制焦点"),
            ),
            FocusTest(),

            Padding(
              padding: EdgeInsets.all(18),
              child:  Text("表单验证"),
            ),
            FormTest(),
          ],
        ),
      ),
      floatingActionButton:   FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(
                    "用户名：" + _usernameController.text + '\n' +
                    "密码：" + _password
                  ,
                ),
              );
            },
          );
        },
        tooltip: "点击获取输入框的值",
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

/// 控制焦点
class FocusTest extends StatefulWidget{
  @override
  _FocusTestState createState() => new _FocusTestState();
}

class _FocusTestState extends State<FocusTest>{
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "input1",
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "input2",
            ),
          ),
          Builder(builder: (ctx){
            return Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("移动焦点"),
                  onPressed: (){
//                    FocusScope.of(context).requestFocus(focusNode2);
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }

                      focusScopeNode.requestFocus(focusNode2);
                  },
                ),
                RaisedButton(
                  child: Text("隐藏键盘"),
                  onPressed: () {
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                )
              ],
            );
          },)
        ],
      ),
    );
  }
}

/// 表单验证
class FormTest extends StatefulWidget{
  @override
  _FormTestState createState() => new _FormTestState();
}

class _FormTestState extends State<FormTest>{
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 24.0),
      child: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person),
              ),
              // 校验用户名
              validator: (v){
                return v
                    .trim()
                    .length > 0 ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "登录密码",
                icon: Icon(Icons.lock),
              ),
              // 校验用户名
              validator: (v){
                return v
                    .trim()
                    .length > 5 ? null : "密码不能少于6位";
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));

                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if((_formKey.currentState as FormState).validate()){
                          //验证通过提交数据
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
        ]),
      ),
    );
  }
}
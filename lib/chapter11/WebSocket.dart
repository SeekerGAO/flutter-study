import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketRoute extends StatefulWidget {
  @override
  _WebSocketRouteState createState() => _WebSocketRouteState();
}

class _WebSocketRouteState extends State<WebSocketRoute> {
  IOWebSocketChannel channel;
  TextEditingController _controller = new TextEditingController();
  String _text = "";

  @override
  void initState() {
    // TODO: implement initState
    // 创建websocket连接
    channel = new IOWebSocketChannel.connect("ws://echo.websocket.org");

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // 关闭连接
    channel.sink.close();

    super.dispose();
  }

  void _sendMessage(){
    if(_controller.text.isNotEmpty){
      channel.sink.add(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: "发送消息"),
              ),
            ),
            RaisedButton(
              child: Icon(Icons.send),
              onPressed: _sendMessage,
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  _text = "网络不通";
                } else if (snapshot.hasData) {
                  _text = "echo: " + snapshot.data;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

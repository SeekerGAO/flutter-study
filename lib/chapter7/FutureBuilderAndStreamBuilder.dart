import 'package:flutter/material.dart';

class FutureBuilderAndStreamBuilderRoute extends StatelessWidget {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "返回模拟网络数据");
  }

  Stream<int> counter() {
    return Stream.periodic(Duration(seconds: 1), (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 请求已结束
              if (snapshot.connectionState == ConnectionState.done) {
                // 请求出错
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                // 请求未结束，显示loading状态
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        Center(
          child: StreamBuilder<int>(
            stream: counter(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('没有Stream');
                case ConnectionState.waiting:
                  return Text('等待数据...');
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return Text('Stream已关闭');
              }
              return null; // unreachable
            },
          ),
        )
      ],
    );
  }
}

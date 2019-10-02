import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileOperationsRoute extends StatefulWidget {
  FileOperationsRoute({
    Key key,
  }) : super(key: key);

  @override
  _FileOperationsRouteState createState() => _FileOperationsRouteState();
}

class _FileOperationsRouteState extends State<FileOperationsRoute> {
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  /// 获取应用目录
  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  /// 读取文件
  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  /// 写入文件
  Future<Null> _incrementCounter() async {
    setState(() {
      _counter = _counter + 1;
    });

    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Text("点击了 $_counter 次"),
            FlatButton(
              child: Icon(Icons.add),
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              onPressed: _incrementCounter,
            )
          ],
        ),
      ),
    );
  }
}

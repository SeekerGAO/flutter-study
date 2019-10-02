import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioHttpRoute extends StatefulWidget {
  @override
  _DioHttpRouteState createState() => _DioHttpRouteState();
}

class _DioHttpRouteState extends State<DioHttpRoute> {
  Dio _dio = new Dio();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        future: _dio.get("https://api.github.com/orgs/flutter/repos"),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return ListView(
              children: response.data
                  .map<Widget>((e) => ListTile(title: Text(e["full_name"])))
                  .toList(),
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp0/pages/MyOSCClient.dart';

var routes = <String, WidgetBuilder>{
  "/Login": (BuildContext context) => MyOSCClient("qqqqqqqqqq", ""),
//  "/Login": (BuildContext context) => LoginPages(),
};

void main() => runApp(new MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        primaryColorDark: Colors.green),
    debugShowCheckedModeBanner: false,
    home: MyOSCClient("qqqqqqqqqq", ""),
    routes: routes));

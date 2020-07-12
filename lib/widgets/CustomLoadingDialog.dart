import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///自定义加载框
class CustomLoadingDialog {
  static showCustomDialog(BuildContext context, String message, bool isCancel) {
    showDialog(
      context: context,
      child:
         CustomDialogPage(
          message: message,
          isCancel: isCancel,
        ),
    );
  }
}

class CustomDialogPage extends StatefulWidget {
  final String message;
  final bool isCancel;

  CustomDialogPage({Key key, @required this.message, this.isCancel});

  @override
  State<StatefulWidget> createState() {
    return CustomDialogState();
  }
}

class CustomDialogState extends State<CustomDialogPage> {
  String message = "";
  bool isCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CircularProgressIndicator(),
          Text(
            message.isEmpty ? "加载中..." : message,
            style: TextStyle(fontSize: 22, color: Colors.black, inherit: false),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      color: Colors.white,
      margin:
          EdgeInsets.only(top: 350.0, bottom: 350.0, left: 100.0, right: 100.0),
    );
  }
}

import 'package:flutter/material.dart';

class circlePic extends StatefulWidget {
  int indactor;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new circlePicstate();
  }
  circlePic({indactor}) {
    this.indactor = indactor;
    print("constructor $indactor");
  }
}

class circlePicstate extends State<circlePic> {
  int indactor;

  @override
  Widget build(BuildContext context) {
    print("circle $indactor");
    // TODO: implement build
    if (0 == this.widget.indactor) {
      return new Container(
          width:20,height:10,child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xff888888), shape: BoxShape.circle),
              padding: const EdgeInsets.all(1.0),
            ),
          ),
          SizedBox(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff), shape: BoxShape.circle),
              padding: const EdgeInsets.all(1.0),
            ),
          ),
        ],
      ));
    }
    if (1 == this.widget.indactor) {
      return new Container(width: 20,height:10,child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xffffffff), shape: BoxShape.circle),
              padding: const EdgeInsets.all(1.0),
            ),
          ),
          SizedBox(
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  color: const Color(0xff888888), shape: BoxShape.circle),
              padding: const EdgeInsets.all(1.0),
            ),
          ),
        ],
      ),);

    }
  }
}

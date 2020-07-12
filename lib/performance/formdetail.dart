import 'package:flutter/material.dart';
import './timepicker.dart';

class FormDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DetailState();
  }
}

class DetailState extends State<FormDetail> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("详情"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
        Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            backgroundBlendMode: BlendMode.darken,
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//            Container(
//              decoration: BoxDecoration(
//                  border: Border.all(
//                      color: Colors.black, width: 1, style: BorderStyle.solid)),
//              child:
          Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      "日期",
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      "达标率",
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text(
                      "档案数",
                    ),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text("达标数"),
                  ),
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.solid)),
                  child: Center(
                    child: Text("不达标数"),
                  ),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
//            ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
              itemExtent: 30,
              itemBuilder: (BuildContext context, int index) {
                return new
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            backgroundBlendMode: BlendMode.darken,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Text("$index"),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            backgroundBlendMode: BlendMode.darken,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Text("1"),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            backgroundBlendMode: BlendMode.darken,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Text("1"),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            backgroundBlendMode: BlendMode.darken,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Text("2"),
                        ),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            backgroundBlendMode: BlendMode.darken,
                            border: Border.all(
                                color: Colors.white,
                                width: 1,
                                style: BorderStyle.solid)),
                        child: Center(
                          child: Text("3"),
                        ),
                      ),
                      flex: 1,
                    ),

                  ],
                );
              }),


//                  Expanded(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("达标数"),
//                            ),
//                          ),
//                          flex: 2,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("1"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("2"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("3"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("4"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("5"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("6"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                      ],
//                    ),
//                    flex: 1,
//                  ),
//                  Expanded(
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("不达标数"),
//                            ),
//                          ),
//                          flex: 2,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("1"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("2"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("3"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("4"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("5"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                        Expanded(
//                          child: Container(
//                            decoration: BoxDecoration(
//                                color: Colors.black12,
//                                backgroundBlendMode: BlendMode.darken,
//                                border: Border.all(
//                                    color: Colors.white,
//                                    width: 1,
//                                    style: BorderStyle.solid)),
//                            child: Center(
//                              child: Text("6"),
//                            ),
//                          ),
//                          flex: 1,
//                        ),
//                      ],
//                    ),
//                    flex: 1,
                  ),
          ],
        ),
      ),
    ),new
    TimePicker
    (
    )
    ,
    ]
    ,
    )
    ,
    );
  }
}

import 'package:flutter/material.dart';
import './wdxlbean.dart';
import './timepicker.dart';
import 'package:http/http.dart' as myhttp;
import '../constants/Constants.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wdxl extends StatefulWidget {
  String title;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new wdxlState(title);
  }

  wdxl({Key key, this.title}) : super(key: key) {
    parseTile(title);
  }

  void parseTile(String title) {}
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}

Widget _loading() {
  return Column(
    children: <Widget>[
      new Container(
        height: 300.0,
        child: new Center(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            new Text("正在加载"),
          ],
        )),
      )
    ],
  );
}

class wdxlState extends State<wdxl> {
  var datas = [new wdxlbean("1", "2", "3", "4")];
  String t, test;
  List<wdxlbean> data;
  final GlobalKey _key = new GlobalKey(debugLabel: "11");
  final GlobalKey ik = new GlobalKey();
  Offset offset;
  double height, width;
  bool ist = true;
  String vars = "1";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _request("");
  }

  void _request(String vars) async {
    await myhttp
        .post(Constants.BASEURL + Constants.YEJIKANBAN)
        .then((myhttp.Response res) {
      String s = res.body.toString();
      print("res to string $s");
      var convert = json.decode(res.body.toString());
      print(convert["data"]);
      convert = convert["data"];
      var items = new List<wdxlbean>();
      convert.forEach((item) {
        items.add(
            wdxlbean(item["xlmc"], item["xlbh"], item["xsl"], item["pum"]));
      });
      setState(() {
        data = items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text(
            t,
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              key: _key,
              icon: Icon(new IconData(20)),
              onPressed: () {
                RenderBox object = _key.currentContext.findRenderObject();
                height = object.size.height;
                width = object.size.width;
                offset = object.localToGlobal(Offset.zero);
                print("点击icon${[offset.dy, offset.dx]}");
                _showPOP2();
//                _showPOP(_key.currentContext);
              },
            )
          ],
        ),
        body: data == null
            ? _loading()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Center(child: Text("#")),
                          flex: 1,
                        ),
                        Expanded(
                          child: Center(
                              child: Text(
                            "线路名称",
                          )),
                          flex: 2,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Center(
                              child: Text("线路编号"),
                            ),
                            onTap: () {
                              if (data == null) return;
//                      for(int i=0;i<data.length;i++){
                              if (ist) {
                                data.sort((a, b) => a.xlbh.compareTo(b.xlbh));
                                ist = false;
                              } else {
                                data.sort((a, b) => b.xlbh.compareTo(a.xlbh));
                                ist = true;
                              }
//                      }
                              setState(() {});
                            },
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Center(
                            child: Text("线损率"),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              key: ik,
                              width: 200,
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: Colors.black12, width: 1)),
                              child: Row(
                                children: <Widget>[
                                  Text("全部"),
                                  Expanded(
                                    flex: 1,
                                    child: Text(""),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: Image(
                                      image:
                                          AssetImage("images/xialajiantou.png"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              _showPOP1();
                              print("show choice window");
                            },
                          ),
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  Expanded(
                      flex: 1,
                      child: ListView.builder(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 10),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var model = data[index];
                            return null == model
                                ? ""
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            child: Center(
                                              child: Text("$index"),
                                            ),
                                            flex: 1,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                "${model == null ? "" : model.xlmc}",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Center(
                                                child: Text(
                                                    "${model == null ? "" : model.xlbh}",
                                                    textAlign:
                                                        TextAlign.center)),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                  "${model == null ? "" : model.xsl}",
                                                  textAlign: TextAlign.center),
                                            ),
                                            flex: 2,
                                          ),
                                          Expanded(
                                            child: Center(child: Text("全部")),
                                            flex: 2,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        color: Colors.black12,
                                        height: 1,
                                        padding: EdgeInsets.only(bottom: 5),
                                      ),
                                    ],
                                  );
                          })),
                  GestureDetector(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                      child: new TimePicker(),
                    ),
                    onTap: () {
                      print("datepicker");
                    },
                  ),
                ],
              ));
  }

  // ignore: implicit_this_reference_in_initializer
  _showPOP(BuildContext c) {
    if (null == offset) return;
    showMenu(
      elevation: 1.0,
      position: RelativeRect.fromLTRB(
          offset.dx, offset.dy + height, offset.dx + width, 50),
      context: c,
      items: <PopupMenuEntry<String>>[
        new PopupMenuItem(
          value: "1",
          child: Text("全部"),
        ),
        new PopupMenuDivider(
          height: 1,
        ),
        new PopupMenuItem(
          child: Text("达标"),
          value: "2",
        ),
        new PopupMenuDivider(
          height: 1,
        ),
        new PopupMenuItem(
          value: "3",
          child: Text("不达标"),
        ),
        new PopupMenuDivider(
          height: 1,
        ),
        new PopupMenuItem(
          value: "4",
          child: Text("白名单"),
        ),
//          new PopupMenuItem(child: Text("2222")),
      ],
    );
    _request(vars);
  }

  _showPOP2() {
    new PopupMenuButton<String>(
      itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            new PopupMenuItem(child: Text("hahaha")),
          ],
    );
  }

  _showPOP1() async {
    RenderBox rb = ik.currentContext.findRenderObject();
    Offset offset1 = rb.localToGlobal(Offset.zero);
    double h, w;
    if (null == offset1) return;
    h = rb.size.height;
    w = rb.size.width;
    vars=await showMenu(
        elevation: 1.0,
        position:
            RelativeRect.fromLTRB(offset1.dx, offset1.dy + h, offset1.dx, 10),
        context: context,
        items: <PopupMenuEntry<String>>[
          new PopupMenuItem(
            value: "1",
            child: Text("全部"),
          ),
          new PopupMenuDivider(
            height: 1,
          ),
          new PopupMenuItem(
            child: Text("达标"),
            value: "2",
          ),
          new PopupMenuDivider(
            height: 1,
          ),
          new PopupMenuItem(
            value: "3",
            child: Text("不达标"),
          ),
          new PopupMenuDivider(
            height: 1,
          ),
          new PopupMenuItem(
            value: "4",
            child: Text("白名单"),
          ),
//          new PopupMenuItem(child: Text("2222")),
        ]);
    print("vars--$vars");
    data=null;
    setState(() {
      _request(vars);
    });
  }

  wdxlState(this.t) {}
}

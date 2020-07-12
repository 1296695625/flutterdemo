import 'package:charts_common/src/chart/common/series_renderer_config.dart';
import 'package:flutter/material.dart';
import './timepicker.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_common/common.dart' as com;
import './pm.dart';
import './wdxl.dart';
import './circlePic.dart';
import './formdetail.dart';

//import  'package:flutter/src/painting/basic_types.dart';
import 'dart:math';
import 'package:flutter/painting.dart';
import './dashboard.dart';

class PerformanceHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PerformanceHomeState();
  }
}

class PerformanceHomeState extends State<PerformanceHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var paiming = 1;
  var zhibiao = 100;
  var tongji = 1;
  var glfw = 1;
  var wodetaiqu = 1;
  var hbgyd = 1;
  var indator = 0;
  List<bool> isExpandeds = [false, false, false];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ignore: return_of_invalid_type
    return new Scaffold(
//      appBar: AppBar(title:Text("业绩看板"),centerTitle: true,),
      body:
//      NestedScrollView(headerSliverBuilder: ( BuildContext context, bool i){
//                        return <Widget>[];
//                        },
////        scrollDirection: Axis.vertical,
//        body:
//      Column(
//        children: <Widget>[
//          Flex(
//            direction: Axis.vertical,
//            children: <Widget>[
//
          SingleChildScrollView(
//        controller: PageController(),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        scrollDirection: Axis.vertical, // ignore: ambiguous_import
        child: Center(
            child: Column(
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new TimePicker(),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/fangkuai.png"),
                        width: 20,
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("达标率"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(""),
                      ),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "排名：$paiming",
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                        onTap: () {
                          switchpaiming();
                        }, //点击跳转到详情
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 500,
                    height: 300,
                    child: NestedScrollView(
                      headerSliverBuilder: (BuildContext context, bool i) {
                        return <Widget>[];
                      },
//                      controller: ,
                      scrollDirection: Axis.horizontal,
                      body:
//                        Center(
//                          child:
                          PageView.builder(
//                            physics: PageScrollPhysics(),
//                            controller: PageController(),
                        itemCount: 2,
                        onPageChanged: (int index) {
                          setState(() {
                            indator = index;
                          });
                          print("index  $index, $indator");
                        },
                        pageSnapping: true,
                        itemBuilder: (BuildContext context, int index) {
                          if (1 == index) {
//                            return  new LineAnimationZoomChart();
                            charts.LineChart lineChart = new charts.LineChart(
                                createLine(),
                                animate: true,
                                behaviors: [
                                  new charts.PanAndZoomBehavior(),
                                ]);
                            return
//                                  GestureDetector(
                                Column(
                              children: <Widget>[
                                Expanded(child:
//                                NestedScrollView(headerSliverBuilder: (BuildContext context,bool i) {return <Widget>[];}, body:
                                lineChart,
//                                ),
                                  flex: 1,),
//                                SizedBox(
//                                  child:

////                                  width: 500,
//                                  height: 200,
//                                ),
                                SizedBox(
                                  child: _createTable(),
                                  width: 500,
                                  height: 100,
                                ),
                              ],
                            );

//                                  )
                            ;
                          }
//                                if(2==index){
//                                return GestureDetector(
//                                  child: Container(
//                                    decoration: BoxDecoration(
//                                        border: Border.all()),
//                                    child: Text("first page - $index"),
//                                    width: 100,
//                                    height: 100,
//                                  ),
//                                  onTap: () {
//                                    print("click page - $index");
//                                  },
//                                );
//                              return null;
//                              }
                          else {
                            return DashBoard();
                          }
                        },
                      ),
//                        ),
                    ),
                  ),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Spacer(
                          flex: 1,
                        ),
                        SizedBox(
                          child: new circlePic(
                            indactor: indator,
                          ),
//                              Image(image: AssetImage("images/bluequan.png")),
                          width: 20,
                          height: 10,
                        ),
//                        SizedBox(
//                          child:
//                              Image(image: AssetImage("images/greyquan.png")),
//                          width: 10,
//                          height: 10,
//                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      Align(
//                        child: Image(
//                            image: AssetImage("images/guanli.png"),
//                            height: 30,
//                            width: 30),
//                        alignment: Alignment(1, 1),
//                      ),
//                      Text(
//                        "haha",
//                        style: TextStyle(color: Colors.black),
//                      ),
//                    ],
//                  ),
                  ExpansionPanelList(
                    expansionCallback: (int panelindes, bool isexpand) {
                      print("expansionpanellist--$panelindes");
                      setState(() {
                        isExpandeds[panelindes] = !isexpand;
                      });
                    },
                    children: [
                      ExpansionPanel(
                          headerBuilder: (BuildContext context, bool iss) {
                            return Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 3,
                                ),
                                Align(
                                  child: Image(
                                      image: AssetImage("images/guanli.png"),
                                      height: 30,
                                      width: 30),
                                  alignment: Alignment(1, 1),
                                ),
                                Text(
                                  "管理范围($glfw)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            );
                          },
                          body: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  switchRoute("我的线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "我的线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$wodetaiqu",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("含办公用电线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "含办公用电线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$hbgyd",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          isExpanded: isExpandeds[0]),
                      ExpansionPanel(
                          headerBuilder: (BuildContext context, bool iss) {
                            return Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Align(
                                  child: Image(
                                    image: AssetImage("images/zb.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                  alignment: Alignment(1, 1),
                                ),
                                Text(
                                  "指标情况($zhibiao%)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            );
                          },
                          body: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "线路线损达标率",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Text(
                                    "$zhibiao%",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          isExpanded: isExpandeds[1]),
                      ExpansionPanel(
                          headerBuilder: (BuildContext context, bool iss) {
                            return Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                Align(
                                  alignment: Alignment(1, 1),
                                  child: Image(
                                    image: AssetImage("images/tongji.png"),
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Text(
                                  "线路动态统计($tongji)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            );
                          },
                          body: Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  switchRoute("线损波动大线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "线损波动大线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("大电量线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "大电量线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("大里程线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "大里程线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("轻载线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "轻载线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("重载线路");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "重载线路",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  switchRoute("线路长度数据缺失");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "线路长度数据缺失",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(
                                      flex: 1,
                                    ),
                                    Text(
                                      "$glfw",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                          isExpanded: isExpandeds[2]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )), //                  Padding(
//                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
//            ],
//          ),
//        ],
//      ),
    );
  }

  void switchpaiming() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new pm();
    }));
  }

  void switchRoute(String s) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new wdxl(
        title: s,
      );
    }));
  }

  var o = new Offset(10.0, 10.0);

  Widget _createTable() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context){
          return new FormDetail();
        }));
        print("click to details");
      },
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
            Expanded(
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
                          "达标率",
                        ),
                      ),
                    ),
                    flex: 2,
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
                        child: Text(
                          "1",
                        ),
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
                        child: Text("4"),
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
                        child: Text("5"),
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
                        child: Text("6"),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
//            ),
            Expanded(
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
                        child: Text("档案数"),
                      ),
                    ),
                    flex: 2,
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
                        child: Text("4"),
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
                        child: Text("5"),
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
                        child: Text("6"),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),

            Expanded(
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
                        child: Text("达标数"),
                      ),
                    ),
                    flex: 2,
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
                        child: Text("4"),
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
                        child: Text("5"),
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
                        child: Text("6"),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
            Expanded(
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
                        child: Text("不达标数"),
                      ),
                    ),
                    flex: 2,
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
                        child: Text("4"),
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
                        child: Text("5"),
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
                        child: Text("6"),
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }

  List<charts.Series<LineBean, int>> createLine() {
    final List<charts.Series<LineBean, int>> seriesList = new List();
    var datas = <LineBean>[];
    final random = new Random();
    for (var i = 0; i < 100; i++) {
//      datas.add(new LineBean(i, random.nextInt(100)));
    }
    datas.add(new LineBean(10, 45));
    datas.add(new LineBean(2, 2));
    datas.add(new LineBean(3, 3));
    datas.add(new LineBean(5, 5));
    datas.add(new LineBean(0, -1));
    datas.add(new LineBean(2, 7));
    datas.add(new LineBean(3, 15));
    datas.add(new LineBean(11, 5));
    seriesList.add(new charts.Series<LineBean, int>(
        id: "line",
        displayName: "line",
        data: datas,
        colorFn: (LineBean bean, _) => com.Color.black,
        domainFn: (LineBean bean, _) => bean.xData,
        measureFn: (LineBean bean, _) => bean.yData));
    return seriesList;
  }
}

class LineBean {
  final int xData;
  final int yData;

  LineBean(this.xData, this.yData);
}

class MySeriesRender extends com.SeriesRendererConfig {
  MySeriesRender() {}

  @override
  charts.SeriesRenderer build() {
    // TODO: implement build
    return null;
  }

  @override
  // TODO: implement customRendererId
  String get customRendererId => null;

  @override
  // TODO: implement rendererAttributes
  RendererAttributes get rendererAttributes => null;

  @override
  // TODO: implement symbolRenderer
  com.SymbolRenderer get symbolRenderer => null;
}

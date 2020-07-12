import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutterapp0/model/ChartFlutterBean.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new systemPagerState();
  }
}

class systemPagerState extends State<DiscoveryPage> {
  bool amimate;
  List<Widget> widgetList = List();
  static const String TAG_START = "startDivider";
  static const String TAG_END = "endDivider";
  static const String TAG_CENTER = "centerDivider";
  static const String TAG_BLANK = "blankDivider";

  static const double IMAGE_ICON_WIDTH = 30.0;
  static const double ARROW_ICON_WIDTH = 16.0;
  final imagePaths = [
    "images/ic_discover_softwares.png",
    "images/ic_discover_git.png",
    "images/ic_discover_gist.png",
    "images/ic_discover_scan.png",
  ];
  final rightArrowIcon = new Image.asset(
    'images/ic_arrow_right.png',
    width: ARROW_ICON_WIDTH,
    height: ARROW_ICON_WIDTH,
  );
  final titleTextStyle = new TextStyle(fontSize: 16.0);
  List listData = [];

  var _textContainer = null;
  var offage = false;

  DiscoveryPage() {}

  @override
  void initState() {
    super.initState();
    textlist();
  }

/*  @override
  void dispose() {
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (index == 1) {
            return ListTile(
              title: datalist(),
            );
          } else if (index == 0) {
            return new Container(
              width: 500.0,
              height: 200.0,
              child: loadChartData(),
            );
          } else if (index == 2) {
            return textlist();
          } else if (index == 3) {
            return new ListTile(
              title: datalist1(),
            );
          } else if (index == 4) {
            return new ListTile(
              title: textlist1(),
            );
          } else if (index == 5) {
            return new ListTile(
              title: datalist2(),
            );
          } else if (index == 6) {
            return new ListTile(
              title: textlist2(),
            );
          } else if (index == 7) {
            return new ListTile(
              title: datalist3(),
            );
          } else if (index == 8) {
            return new ListTile(
              title: textlist3(),
            );
          } else {
            return null;
          }
        },
      ),
    );
  }

  datalist() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        child: new Row(children: [
          new Expanded(
              child: new Text(
            "档案监测 (0)",
            style: new TextStyle(fontSize: 20),
          )),
          new Image.asset(
            "images/ic_arrow_right.png",
            width: 18,
            height: 18,
          )
        ]),
      ),
      onTap: () {
        setState(() {
          offage = !offage;
        });
      },
    );
  }

  datalist1() {
    return Container(
      padding: EdgeInsets.all(15),
      child: new Row(children: [
        new Expanded(
            child: new Text(
          "线损监测 (0)",
          style: new TextStyle(fontSize: 20),
        )),
        new Image.asset(
          "images/ic_arrow_right.png",
          width: 18,
          height: 18,
        )
      ]),
    );
  }

  datalist2() {
    return Container(
      padding: EdgeInsets.all(15),
      child: new Row(children: [
        new Expanded(
            child: new Text(
          "采集监测 (0)",
          style: new TextStyle(fontSize: 20),
        )),
        new Image.asset(
          "images/ic_arrow_right.png",
          width: 18,
          height: 18,
        )
      ]),
    );
  }

  datalist3() {
    return Container(
      padding: EdgeInsets.all(15),
      child: new Row(children: [
        new Expanded(
            child: new Text(
          "模型监测 (0)",
          style: new TextStyle(fontSize: 20),
        )),
        new Image.asset(
          "images/ic_arrow_right.png",
          width: 18,
          height: 18,
        )
      ]),
    );
  }

  textlist() {
    return Container(
      child: Offstage(
          child: Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: new Column(children: [
              new Row(
                children: [
                  new Expanded(child: new Text("新投台区")),
                  new Text("(0)")
                ],
              ),
              new Row(
                children: [
                  new Expanded(child: new Text("台区找不到计重点")),
                  new Text("(0)")
                ],
              ),
              new Row(
                children: [
                  new Expanded(child: new Text("台区无配变")),
                  new Text("(0)")
                ],
              ),
              new Row(
                children: [
                  new Expanded(child: new Text("台户关系为空")),
                  new Text("(0)")
                ],
              ),
              new Row(
                children: [
                  new Expanded(child: new Text("台户关系与营销不一致")),
                  new Text("(0)")
                ],
              ),
            ]),
          ),
          offstage: offage),
    );
  }

  textlist1() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: new Column(children: [
        new Row(
          children: [new Expanded(child: new Text("本月新转异常")), new Text("(0)")],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("连续异常(2月)")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("连续异常(3月)")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [new Expanded(child: new Text("高损台区")), new Text("(0)")],
        ),
        new Row(
          children: [new Expanded(child: new Text("负损台区")), new Text("(0)")],
        ),
      ]),
    );
  }

  textlist2() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: new Column(children: [
        new Row(
          children: [new Expanded(child: new Text("采集失败户数")), new Text("(0)")],
        ),
        new Row(
          children: [new Expanded(child: new Text("上底表缺失")), new Text("(0)")],
        ),
        new Row(
          children: [new Expanded(child: new Text("上下底表缺失")), new Text("(0)")],
        ),
        new Row(
          children: [new Expanded(child: new Text("电量突变")), new Text("(0)")],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("下底表小于上底表无换表记录")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [new Expanded(child: new Text("光伏用户异常")), new Text("(0)")],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("前三天合格后三天不合格")),
            new Text("(0)")
          ],
        ),
      ]),
    );
  }

  textlist3() {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: new Column(children: [
        new Row(
          children: [
            new Expanded(child: new Text("模型、档案状态不一致（有档案，无模型）")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("模型、档案状态不一致（有模型、无档案）")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [new Expanded(child: new Text("有模型、无配变")), new Text("(0)")],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("模型、档案管理单位不一致")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("分布式电源未配置到输入侧")),
            new Text("(0)")
          ],
        ),
        new Row(
          children: [
            new Expanded(child: new Text("有反送电量未配到输出侧")),
            new Text("(0)")
          ],
        ),
      ]),
    );
  }

  loadChartData() {
    return charts.BarChart(
      ChartFlutterBean.createSampleData(),
      animate: amimate,
      barGroupingType: charts.BarGroupingType.groupedStacked,
    );
  }

  void handleListItemClick(ListItem item) {
    String title = item.title;
    if (title == "档案监测") {
    } else if (title == "线损监测") {
    } else if (title == "采集监测") {
    } else if (title == "模型监测") {}
  }
}

class ListItem {
  String icon;
  String title;

  ListItem({this.icon, this.title});
}

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      _createSampleData(),
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

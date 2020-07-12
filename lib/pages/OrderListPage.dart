import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterapp0/pages/OrderDetailPage.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../base/GlobleManager.dart';

///工单列表界面
class TweetsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TweetsListPageState();
  }
}

class TweetsListPageState extends State<TweetsListPage> {
  List dataResult;
  RefreshController _refreshController = RefreshController();
  String userid = '';
  String username = '';
  String orgid = '';
  String gdlb = '';
  String gdrq = '';
  var dataList;
  var flag = 0;
  List<String> names = ["全部", "未办", "已办"];
  static final int isChecked = 1;
  static final int unChecked = 0;
  static final String GDLB_NAME = "GDLB";
  static final String GDRQ_NAME = "GDRQ";
  List<int> states = [isChecked, unChecked, unChecked];
  List<String> gdlbs = ["全部", "线损异常", "采集异常", "档案异常", "模型异常"]; //依次对应0 1 2 3 4
  List<String> gdrqs = ["全部", "今天", "近一周", "近半月", "近一月"]; //依次对应0 1 2 3 4
  String tvGdlb = "全部"; //工单类型
  String tvGdrq = "全部"; //工单日期
  ValueNotifier<RefreshStatus> headerMode = ValueNotifier(RefreshStatus.idle);

  RefreshStatus refreshStatus = RefreshStatus.idle;

  @override
  void initState() {
    super.initState();
    setDatabase(); //初始化数据库
    _loadData();
  }

  TweetsListPageState();

  @override
  Widget build(BuildContext context) {
    if (dataResult == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return _initSmartRefresher();
  }

  ///初始化下拉列表
  _initSmartRefresher() {
    return SmartRefresher(
//      headerConfig: RefreshConfig(),
      header: WaterDropHeader(),
      enablePullDown: true,
      enablePullUp: true,
//      enableOverScroll: true,
//      onRefresh: _onRefresh,

      controller: _refreshController,
      child: _initListView(),
    );
  }

  ///  初始化ListView的item
  _initListView() {
//    _refreshController.sendBack(true, loadResultState);
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return _initSpinnerView();
        }
        var i = index ~/ 2;
        if (index.isOdd) //奇数
          return Divider();
        if (i >= dataResult.length) {
          return null;
        }
        String ycsj = dataResult[i]['ycsj'];
        String gdbh = dataResult[i]['gdbh'];
        String tqmc = dataResult[i]['tqmc'];
        String tqbh = dataResult[i]['tqbh'];
        String tqxs = dataResult[i]['tqxs'];
        String tqId = dataResult[i]['tqId'];
        String gdzt = dataResult[i]['gdzt'];
        String scsj = dataResult[i]['scsj'];
        String gdycs = dataResult[i]['gdycs'];
        return dataResult.length > 0
            ? ListTile(
                title: Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("工单编号:"),
                        Text(gdbh == null ? "" : gdbh),
                        Expanded(
                          child: Container(
                            child: Align(
                                child: Image(
                                  image: AssetImage(
                                      "images/tqjl/daiban_manager.png"),
                                  width: 20.0,
                                  height: 20.0,
                                ),
                                alignment: Alignment.centerRight),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("台区名称:"),
                        Text(tqmc == null ? "" : tqmc),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("台区编号:"),
                        Text(tqbh == null ? "" : tqbh),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("台区线损:"),
                        Text(tqxs == null ? "" : tqxs),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("异常时间:"),
                        Text(ycsj == null ? "" : ycsj),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("生成时间:"),
                        Expanded(
                          child: Text(scsj == null ? "" : scsj),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            gdycs == null ? "(异常数:0)" : "(异常数:" + gdycs + ")",
                            style: TextStyle(color: Colors.red),
                          ),
                          flex: 1,
                        ),
                      ],
                    ),
                  ],
                )), //Text(data[i])
                onTap: () {
                  setState(() {
                    //跳转到工单详情界面
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return OrderDetailPage(ycsj, gdbh, tqId, gdzt);
                      }),
                    );
                  });
                },
              )
            : null;
      },
      physics: const AlwaysScrollableScrollPhysics(),
    );
  }

  ///初始化ListView列表上面的下拉框Spinner布局（包括最上面的横向布局）
  _initSpinnerView() {
    return Column(
      children: <Widget>[
        _initTopContainer(),
        Row(
          children: <Widget>[
            Expanded(
              child: _initChoiceMenu(GDLB_NAME),
              flex: 1,
            ),
            Expanded(
              child: _initChoiceMenu(GDRQ_NAME),
              flex: 1,
            ),
          ],
        ),
      ],
    );
  }

  ///初始化下拉列表上面的横向布局
  _initTopContainer() {
    return Container(
      child: Row(
        children: <Widget>[_initButton(0), _initButton(1), _initButton(2)],
      ),
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      color: Colors.white,
    );
  }

  /// 初始化最上面的三个按钮
  _initButton(int position) {
    return Expanded(
      child: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              _btnPress(position);
            },
            child: Text(
              names[position],
              style: TextStyle(color: Colors.white),
            ),
            color: states[position] == isChecked ? Colors.green : Colors.grey,
//                disabledColor: Colors.green,
            highlightColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      ),
      flex: 1,
    );
  }

  /// 最上面三个按钮的点击事件
  _btnPress(int position) {
    //请求接口
    _loadData();
    setState(() {
      if (states[position] == unChecked) {
        for (int i = 0; i < states.length; i++) {
          states[i] = unChecked;
        }
        states[position] = isChecked;
      }
    });
  }

  /// 初始化类别和日期选择的下拉列表
  _initChoiceMenu(String state) {
    return Container(
      child: GestureDetector(
        child: Container(
          child: Row(
            children: <Widget>[
              Text(
                state == GDLB_NAME ? tvGdlb : tvGdrq,
                style: TextStyle(color: Colors.green),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    child: Container(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "images/tqjl/xia_manager.png",
                              ),
                              fit: BoxFit.scaleDown),
                        ),
                      ),
                      width: 10.0,
                      height: 10.0,
                    ),
                    alignment: Alignment.centerRight,
                  ),
                  padding: EdgeInsets.only(right: 20.0),
                ),
              )
            ],
          ),
          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          color: Colors.white,
        ),
        onTap: state == GDLB_NAME ? _choiceGdlb : _choiceGdrq,
      ),
      padding: state == GDLB_NAME
          ? EdgeInsets.all(0.5)
          : EdgeInsets.only(top: 0.5, bottom: 0.5, right: 0.5),
      color: Colors.black,
    );
  }

  /// 选择工单类别
  _choiceGdlb() async {
    String result = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0.0, 210.0, 100.0, 100.0),
      items: <PopupMenuEntry<String>>[
        _initPopupMenuItem(GDLB_NAME, 0),
        new PopupMenuDivider(height: 1.0),
        _initPopupMenuItem(GDLB_NAME, 1),
        new PopupMenuDivider(height: 1.0),
        _initPopupMenuItem(GDLB_NAME, 2),
        new PopupMenuDivider(height: 1.0),
        _initPopupMenuItem(GDLB_NAME, 3),
        new PopupMenuDivider(height: 1.0),
        _initPopupMenuItem(GDLB_NAME, 4),
        new PopupMenuDivider(height: 1.0),
      ],
    );
    setState(() {
      gdlb = result;
      tvGdlb = gdlbs[int.parse(result)];
      _loadData();
    });
  }

  ///选择工单日期
  _choiceGdrq() async {
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(210.0, 200.0, 90.0, 0.0),
        items: <PopupMenuEntry<String>>[
          _initPopupMenuItem(GDRQ_NAME, 0),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(GDRQ_NAME, 1),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(GDRQ_NAME, 2),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(GDRQ_NAME, 3),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(GDRQ_NAME, 4),
          new PopupMenuDivider(height: 1.0),
        ]);
    setState(() {
      gdrq = result;
      tvGdrq = gdrqs[int.parse(result)];
      _loadData();
    });
  }

  ///初始化下拉列表的item
  _initPopupMenuItem(String state, int index) {
    return state == GDLB_NAME
        ? new PopupMenuItem(
            value: index.toString(), child: new Text(gdlbs[index]))
        : new PopupMenuItem(
            value: index.toString(), child: new Text(gdrqs[index]));
  }

  ///下拉刷新
  _onRefresh(bool down) {
    if (down) {
      _loadData();
    } else {}
    _refreshController.refreshCompleted();
  }

  /// 请求网络
  _loadData() async {
    var url = GlobleManager.getUrls("gdhome");
    try {
      await http.post(url, body: {
        "token": "",
        "userid": userid,
        "username": username,
        "orgId": orgid,
        "gdlb": gdlb,
        "gdrq": gdrq
      }).then((response) {
        if (response.statusCode == HttpStatus.ok) {
          print(response.body);
          //填充数据
          var result = json.decode(response.body);
          var msg = result["msg"];
          var code = result["code"];
          if (code == 10000) {
            setState(() {
              refreshStatus = RefreshStatus.completed;
              var listData = result["data"];
              dataResult = listData;
            });
          }
        } else {
          setState(() {
            refreshStatus = RefreshStatus.failed;
          });
        }
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        refreshStatus = RefreshStatus.failed;
      });
    }
    _refreshController.loadComplete();
//    _refreshController.sendBack(true, loadResultState);
  }

  /// 初始化数据库
  setDatabase() async {
    //新建数据库
  }
}

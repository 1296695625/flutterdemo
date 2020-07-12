import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../base/GlobleManager.dart';
import '../widgets/CustomLoadingDialog.dart';
import 'OrderFilePage.dart';

///工单详情界面
class OrderDetailPage extends StatefulWidget {
  String ycsj;
  String gdbh;
  String tqId;
  String gdzt;
  OrderDetailPage(this.ycsj, this.gdbh, this.tqId, this.gdzt);

  @override
  State<StatefulWidget> createState() {
    return OrderDetailState(this.ycsj, this.gdbh, this.tqId, this.gdzt);
  }
}

class OrderDetailState extends State<OrderDetailPage> {
  String gdzt;

  var dataResult = {};
  List<dynamic> orderData = <dynamic>[];
  String deviceName = "";
  String ycsj = "";
  String gdbh = "";
  String tqId = "";
  String ycdbh = "";

  String yhbh = "";
  String yhmc = "";
  String yddz = "";
  String ycqk = "";
  String bzsm = "";

  var rowNames = ["用户编号:", "用户名称:", "用电地址:", "异常情况:", "备注说明:"];

  String yhbhNew = "";
  String yhmcNew = "";
  String yddzNew = "";
  String ycqkNew = "";

  String ycdbhDelete = "";
  String sjbs = "";

  OrderDetailState(this.ycsj, this.gdbh, this.tqId, this.gdzt);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    bool noData = orderData == null || orderData.length < 1;
    return Scaffold(
      appBar: AppBar(
        title: Text("工单处理"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _titleRightButtonPress)
        ],
      ),
      body: noData ? _initNoData() : _initListView(),
    );
  }

  ///初始化没有数据的布局
  _initNoData() {
    return Container(
      child: CircularProgressIndicator(),
      color: Colors.white,
      alignment: Alignment.center,
    );
  }

  /// 点击右上角的加号
  _titleRightButtonPress() {
    showDialog(
        context: context,
        builder: (_) {
          return _initNewOrderInfo();
        });
  }

  ///初始化需要新添加的工单信息布局
  _initNewOrderInfo() {
    return Center(
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "用户编号:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        //获取焦点时,启用的键盘类型
                        onChanged: (newValue) {
                          print(newValue); // 当输入内容变更时,如何处理
                        },
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "用户名称:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: Text(yhmcNew),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "用电地址:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: Text(yddzNew),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(
                      "异常情况:",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        //获取焦点时,启用的键盘类型
                        onChanged: (newValue) {
                          print(newValue); // 当输入内容变更时,如何处理
                        },
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                flex: 1,
              ),
              Expanded(
                child: Container(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _addOrder();
                    },
                    child: Text(
                      "保存",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  ),
                  margin: EdgeInsets.only(top: 10.0),
                ),
                flex: 1,
              )
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 20.0)),
          padding: EdgeInsets.all(10.0),
        ),
        color: Colors.white,
        margin:
            EdgeInsets.only(left: 20.0, right: 20.0, top: 250.0, bottom: 250.0),
      ),
    );
  }

  ///初始化设备信息
  _initDeviceInfo() {
    return ListTile(
      title: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "设备名称:" + deviceName,
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            children: <Widget>[Text("异常时间:" + ycsj)],
          )
        ],
      ),
    );
  }

  ///初始化ListView
  _initListView() {
    return ListView.builder(itemBuilder: (context, index) {
      var i = index ~/ 2;
      if (index == 0) {
        return _initDeviceInfo();
      }
      if (index.isOdd) {
        return Divider();
      }
      if (i < 0 || i >= orderData.length) {
        return null;
      }
      return new ListTile(
        title: _initListViewItem(i),
      );
    });
  }

  ///初始化ListView中每一个条目信息
  _initListViewItem(int index) {
    var yhInfo = orderData[index];
    yhbh = yhInfo["yhbh"];
    yhmc = yhInfo["yhmc"];
    yddz = yhInfo["yhdz"];
    ycqk = yhInfo["ycqk"];
    bzsm = yhInfo["bzsm"];
    sjbs = yhInfo["sjbs"];
    bool offstage = true;
    if (sjbs == "1") {
      offstage = false;
    } else {
      offstage = true;
    }
    return ListTile(
      title: Column(
        children: <Widget>[
          Offstage(
            child: _initDeleteLayout(),
            offstage: offstage,
          ),
          _initOrderItemTitle(),
          _initOrderItemContent(0, yhbh),
          _initOrderItemContent(1, yhmc),
          _initOrderItemContent(2, yddz),
          _initOrderItemContent(3, ycqk),
          _initOrderItemContent(4, bzsm),
        ],
      ),
    );
  }

  ///初始化删除工单异常点布局
  _initDeleteLayout() {
    return Container(
      child: GestureDetector(
        child: Image(
          image: AssetImage("images/tqjl/guanbi.png"),
          width: 20.0,
          height: 20.0,
          fit: BoxFit.contain,
        ),
        onTap: () {
          if (sjbs != "1") {
            return;
          }
          _deleteOrder();
        },
      ),
      alignment: Alignment.centerRight,
    );
  }

  ///初始化ListView的title布局
  _initOrderItemTitle() {
    return Row(
      children: <Widget>[
        Text(
          "异常点",
          style: TextStyle(
            color: Colors.green,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Align(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return OrderFilePage();
                  }),
                );
              },
              child: Text(
                "审核",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.green, width: 1.0),
              ),
            ),
            alignment: Alignment.centerRight,
          ),
          flex: 1,
        )
      ],
    );
  }

  ///初始化ListView的content布局
  _initOrderItemContent(int rowIndex, var name) {
    return Row(
      children: <Widget>[
        Text(
          rowNames[rowIndex],
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        Expanded(
          child: Text(name.isEmpty ? "" : name),
          flex: 1,
        )
      ],
    );
  }

  ///请求网络接口加载工单列表
  _loadData() async {
    var url = GlobleManager.getUrls("gdycinfo");
    print(url);
    try {
      await http.post(url, body: {
        "token": GlobleManager.TOKEN,
        "userid": GlobleManager.USERID,
        "username": GlobleManager.USERNAME,
        "orgId": GlobleManager.ORGID,
        "gdbh": gdbh == null ? "" : gdbh,
        "tqId": tqId == null ? "" : tqId,
        "ycdbh": ycdbh == null ? "" : ycdbh
      }).then((response) {
        print("gdycinfo" + response.body);
        if (response.statusCode == HttpStatus.ok) {
          var result = json.decode(response.body);
          var code = result["code"];
          var msg = result["msg"];
          if (code == 10000) {
            print(dataResult.toString());
            dataResult = result["data"];
            setState(() {
              orderData = dataResult["tqyh"];
            });
          } else {
            print("接口返回数据有误！");
          }
        } else {
          print("请求接口失败！");
        }
      });
    } catch (e) {
      print("网络异常！");
    }
  }

  ///请求网络新增工单
  _addOrder() async {
    CustomLoadingDialog.showCustomDialog(context, "", false);
    String url = GlobleManager.getUrls("gdaddycd");
    print(url);
    try {
      await http.post(url, body: {
        "token": GlobleManager.TOKEN,
        "userid": GlobleManager.USERID,
        "username": GlobleManager.USERNAME,
        "orgId": GlobleManager.ORGID,
        "gdbh": gdbh == null ? "" : gdbh,
        "tqId": tqId == null ? "" : tqId,
        "yhbh": yhbh == null ? "" : yhbh,
        "ycqk": ycqk == null ? "" : ycqk,
        "sjbs": "1"
      }).then((response) {
        Navigator.of(context).pop();
        print("gdaddycd" + response.body);
        if (response.statusCode == HttpStatus.ok) {
          var result = json.decode(response.body);
          var code = result["code"];
          var msg = result["msg"];
          if (code == 10000) {
            FlutterToast(context).showToast(
              child: OrderDetailPage(ycsj, gdbh, tqId, gdzt),
            );
            print(msg);
          } else {
            print("接口返回数据有误！");
          }
        } else {
          print("请求接口失败！");
        }
      });
    } catch (e) {
      Navigator.of(context).pop();
      print(e.toString() + "内部解析失败！");
    }
  }

  ///请求网络删除工单
  _deleteOrder() async {
    CustomLoadingDialog.showCustomDialog(context, "", false);
    String url = GlobleManager.getUrls("gddelycd");
    print(url);
    try {
      await http.post(url, body: {
        "token": GlobleManager.TOKEN,
        "userid": GlobleManager.USERID,
        "username": GlobleManager.USERNAME,
        "orgId": GlobleManager.ORGID,
        "gdbh": gdbh == null ? "" : gdbh,
        "tqId": tqId == null ? "" : tqId,
        "ycdbh": ycdbhDelete == null ? "" : ycdbhDelete,
      }).then((response) {
        Navigator.of(context).pop();
        print("gddelycd" + response.body);
        if (response.statusCode == HttpStatus.ok) {
          var result = json.decode(response.body);
          var code = result["code"];
          var msg = result["msg"];
          if (code == 10000) {
//            Fluttertoast.showToast(
//              msg: msg,
//              toastLength: Toast.LENGTH_SHORT,
//            );
            print(msg);
          } else {
            print("接口返回数据有误！");
          }
        } else {
          print("请求接口失败！");
        }
      });
    } catch (e) {
      Navigator.of(context).pop();
      print(e.toString() + "内部解析失败！");
    }
  }
}

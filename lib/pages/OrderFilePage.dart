import 'dart:io';
import 'dart:math' as Math;

import 'package:flutter/material.dart';
import 'package:image/image.dart' as Img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

///工单文件处理界面
class OrderFilePage extends StatefulWidget {
  @override
  createState() => OrderFileState();
}

class OrderFileState extends State<OrderFilePage> {
  var _image;

  var ycyyList = ["窃电问题", "电表异常", "台户关系不对应", "用户表计异常", "采集失败", "其他"];
  var choiceItemsList = [];
  var descriptionItemsList = [];
  var fileItemsList = [];

//  List<>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("工单文件处理"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //添加上传文件
                _addOrderFiles();
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _initListView(),
            flex: 1,
          ),
          _initFooter()
        ],
      ),
//      bottomSheet: _initFooter(),
    );
  }

  ///添加文件描述
  _addOrderFiles() {
    setState(() {
      choiceItemsList.add("其他");
      descriptionItemsList.add("");
      fileItemsList.add("");
    });
  }

  ///初始化ListView
  _initListView() {
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index < choiceItemsList.length) {
          return _initListTile(context, index);
        }
      },
      shrinkWrap: true,
    );
  }

  ///初始化ListView的item
  _initListTile(BuildContext context, int index) {
    GlobalKey anchorKey = GlobalKey();
    return ListTile(
      title: Container(
        child: Column(
          children: <Widget>[
            Align(
              child: GestureDetector(
                child: Image(
                  image: AssetImage("images/tqjl/guanbi.png"),
                  fit: BoxFit.contain,
                  width: 20,
                  height: 20,
                ),
                onTap: () {
                  _deleteFileItem(index);
                },
              ),
              alignment: Alignment.centerRight,
            ),
            Row(
              children: <Widget>[
                Text("原因:"),
                Expanded(
                  child: GestureDetector(
                    key: anchorKey,
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text(choiceItemsList[index]),
                          Expanded(
                            child: Align(
                              child: Image(
                                image: AssetImage(
                                    "images/tqjl/heise_xia_manager.png"),
                              ),
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(5.0),
                    ),
                    onTap: () {
                      _reasonClick(context, anchorKey, index);
                    },
                  ),
                  flex: 1,
                ),
                Container(
                  child: Image(
                    image: AssetImage("images/tqjl/xiangji.png"),
                    width: 30,
                    height: 30,
                  ),
                  margin: EdgeInsets.only(left: 2.0),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text("描述:"),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(0.0)),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(5.0)),
                    padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  ),
                  flex: 1,
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  ///删除某一项item
  _deleteFileItem(int index) {
    setState(() {
      choiceItemsList.removeAt(index);
      descriptionItemsList.removeAt(index);
      fileItemsList.removeAt(index);
    });
  }

  ///选择原因的弹出框
  _reasonClick(BuildContext context, GlobalKey anchorKey, int index) async {
    RenderBox renderBox = anchorKey.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset(0.0, renderBox.size.height));
    Size size = MediaQuery.of(context).size;
    print("X坐标：" + offset.dx.toString());
    final result = await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy,
            size.width - offset.dx, size.height - offset.dy),
        items: <PopupMenuEntry<String>>[
          _initPopupMenuItem(0),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(1),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(2),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(3),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(4),
          new PopupMenuDivider(height: 1.0),
          _initPopupMenuItem(5),
          new PopupMenuDivider(height: 1.0),
        ]);
    setState(() {
      choiceItemsList[index] = ycyyList[int.parse(result)];
    });
  }

  ///原因弹出框的每一项item
  _initPopupMenuItem(int index) {
    return new PopupMenuItem(
        value: index.toString(),
        child: Container(child: Text(ycyyList[index])));
  }

  ///初始化底部按钮布局
  _initFooter() {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: RaisedButton(
                  onPressed: () {
                    _saveFiles();
                  },
                  child: Text(
                    "保存",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Colors.green,
                  padding: EdgeInsets.only(
                      left: 20.0, top: 5.0, bottom: 5.0, right: 20.0),
                ),
                height: 60.0,
              ),
              flex: 1,
            ),
            Expanded(
              child: Container(
                child: RaisedButton(
                  onPressed: () {
                    _uploadFiles();
                  },
                  child: Text(
                    "提交",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  color: Colors.green,
                  padding: EdgeInsets.only(
                      left: 20.0, top: 5.0, bottom: 5.0, right: 20.0),
                ),
                margin: EdgeInsets.only(left: 1.0),
                height: 60.0,
              ),
              flex: 1,
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      decoration:
          BoxDecoration(border: Border.all(width: 1.0, color: Colors.grey)),
      height: 60.0,
    );
  }

  ///保存文件
  _saveFiles() {}

  ///上传文件
  _uploadFiles() {}

  ///打开照相机
  Future getImageGallery() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);
    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image);

    print("$path/image_$rand.jpg");
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  ///打开相册
  Future getImageCamera() async {
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(100000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image);

    print("$path/image_$rand.jpg");
    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }
}

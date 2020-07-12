import 'package:flutter/material.dart';
import './timepicker.dart';
class pm extends StatefulWidget{
  String s;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new paimingstate();
  }
  pm({Key key,this.s}):super(key:key){}
}
class paimingstate extends State<pm>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text("排名"),
        centerTitle: true,
        actions: <Widget>[
//          GestureDetector(
//            onTap: (){
//              print("点击过滤");
//            },
//            child: Image(image: AssetImage("/images/fangkuai.png")),
//          ),
        ],
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new TimePicker(),
          Padding(padding: const EdgeInsets.only(left: 10,top: 10,right: 10,bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Center(child: Text("排名"),),flex: 1,),
                Expanded(child: Center(child: Text("用户名"),),flex: 2,),
                Expanded(child: Center(child: Text("总数"),),flex: 2,),
                Expanded(child: Center(child: Text("达标数"),),flex: 2,),
                Expanded(child: Center(child: Text("达标率%"),),flex: 2,),
              ],
            ),
          ),
          Container(height: 1,color: Colors.black12,),
          Expanded(flex: 1,
            child:ListView.builder(
              padding: const EdgeInsets.only(left: 10,top: 5,right: 10),
              itemExtent: 30,
              itemCount: 30,
              itemBuilder: (BuildContext context,int index){
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(child: Center(child: Text("$index"),),flex: 1,),
                    Expanded(child: Center(child: Text("用户名"),),flex: 2,),
                    Expanded(child: Center(child: Text("总数"),),flex: 2,),
                    Expanded(child: Center(child: Text("达标数"),),flex: 2,),
                    Expanded(child: Center(child: Text("$index%"),),flex: 2,),
                  ],
                );
              }),),
        ],
      ),
    );
  }
}
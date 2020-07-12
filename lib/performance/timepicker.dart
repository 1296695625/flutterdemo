import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new TimePickerState();
  }
}

class TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
//      Flex(
//      direction: Axis.horizontal,
//      children: <Widget>[
        DecoratedBox(
            decoration: BoxDecoration(border: Border.all()),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: GestureDetector(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    //主轴
                    // 纵轴（垂直）方向间距
                    //沿主轴方向居中
                    children: <Widget>[
                      Text("统计周期:"),
                      Expanded(
                        flex: 1,
                        child:
                            Padding(padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "月",
                        ),
                      ),
                      ),
                      Image(
                        image: AssetImage("images/xialajiantou.png"),
                        width: 10,
                        height: 10,
                      ),
                      Text("日期选择:"),
                      Expanded(
                        flex: 1,
                        child:
                        Padding(padding: const EdgeInsets.only(left: 10),
                        child:Text("2018-12"),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    print("click to choose time");
                  },
                )));

//      ],
//    );;
  }
}

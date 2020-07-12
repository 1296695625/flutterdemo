import 'package:flutter/material.dart';
import '../util/DateUtils.dart';
import '../widgets/CustomDatePickerDialog.dart';

typedef SelectedDateCallBack(int year, int month, int day);

///自定义日期选择器控件
class DatePicker {
  BuildContext context;
  int initYear;
  int initMonth;
  int initDay;
  bool isShowDay;
  SelectedDateCallBack selectedDateCallBack;

  DatePicker(
      {Key key,
      @required this.context,
      this.initYear,
      this.initMonth,
      this.initDay,
      this.selectedDateCallBack,
      this.isShowDay});
}

class DatePickerWidget extends StatefulWidget {
  final BuildContext context;
  final int initYear;
  final int initMonth;
  final int initDay;
  final bool isShowDay;
  final SelectedDateCallBack selectedDateCallBack;

  DatePickerWidget(
      {Key key,
      @required this.context,
      this.initYear,
      this.initMonth,
      this.initDay,
      this.selectedDateCallBack,
      this.isShowDay});

  @override
  State<StatefulWidget> createState() => DatePickerWidgetState();
}

class DatePickerWidgetState extends State<StatefulWidget> {
  String typeText = "月";
  String dateText = DateUtils.getNowDate();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _initExpandedLayout(0),
        _initExpandedLayout(1),
      ],
    );
//        _demo();
  }

  _initExpandedLayout(int state) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Row(
          children: <Widget>[
            Text(
              state == 0 ? "统计周期:" : "日期选择:",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Expanded(
              child: GestureDetector(
                child: Container(
                  child: state == 0
                      ? Row(
                          children: <Widget>[
                            Text(
                              typeText == null ? "月" : typeText,
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: Container(
                                child: Image(
                                  image: AssetImage(
                                      "images/tqjl/grey_sanjiao.png"),
                                  width: 10.0,
                                  height: 10.0,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 5.0),
                              ),
                              flex: 1,
                            )
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Text(
                                  dateText,
                                  style: TextStyle(fontSize: 18),
                                ),
                                padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                              ),
                              flex: 1,
                            )
                          ],
                        ),
                  decoration: state == 0
                      ? BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey),
                        )
                      : BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                  padding: const EdgeInsets.only(left: 5.0),
                  margin: const EdgeInsets.only(left: 5.0),
                ),
                onTap: () {
                  _initDialog(state);
                },
              ),
              flex: 1,
            ),
          ],
        ),
        padding: state == 0
            ? EdgeInsets.all(10.0)
            : EdgeInsets.only(left: 10.0, right: 10.0, top: 10.5, bottom: 10.5),
      ),
      flex: 1,
    );
  }

  _initDialog(int state) {
    DatePickerDialog(
            context: context,
            initYear: DateTime.now().year,
            initMonth: DateTime.now().month,
            initDay: DateTime.now().day,
            isShowDay: false,
            cancelCallback: (year, month, day, type) {
              print("取消" + year.toString() + month.toString() + day.toString());
              setState(() {
                type == 0 ? typeText = "月" : typeText = "日";
                dateText =
                    "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
              });
            },
            confirmCallback: (year, month, day, type) {
              print("确定" + year.toString() + month.toString() + day.toString());
              setState(() {
                type == 0 ? typeText = "月" : typeText = "日";
                dateText = DateUtils.getDate(year, month, day);
              });
            },
            onChange: (year, month, day, type) {})
        .showDatePickerDialog();
  }
}

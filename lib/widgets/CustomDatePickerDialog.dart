import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef DateCallback(int year, int month, int day, int type);

const List<int> leapYearMonths = const <int>[1, 3, 5, 7, 8, 10, 12];

const int _minYear = 2000;
const int _maxYear = 2100;
const String _dialogTitle = "时间选择器";
const String _cancelText = "取消";
const String _confirmText = "确定";
const bool _isShowDay = true;

class DatePickerDialog {
  BuildContext context;
  int minYear;
  int maxYear;
  int initYear;
  int initMonth;
  int initDay;
  DateCallback cancelCallback;
  DateCallback confirmCallback;
  DateCallback onChange;
  String dialogTitle;
  String cancelText;
  String confirmText;
  bool isShowDay;
  FixedExtentScrollController yearScrollController,
      monthScrollController,
      dayScrollController;
  int _dayCountOfMonth;

  DatePickerDialog(
      {Key key,
      @required this.context,
      this.minYear,
      this.maxYear,
      this.initYear,
      this.initMonth,
      this.initDay,
      this.cancelCallback,
      this.confirmCallback,
      this.onChange,
      this.dialogTitle,
      this.cancelText,
      this.confirmText,
      this.isShowDay: _isShowDay});

  ///弹出日期选择器的弹出框
  showDatePickerDialog() {
    showDialog(
        context: this.context,
        builder: (_) {
          return /*AlertDialog(
            content:*/
              CustomDatePickerDialog(
            context: this.context,
            minYear: this.minYear == null ? _minYear : this.minYear,
            maxYear: this.maxYear == null ? _maxYear : this.maxYear,
            initYear: this.initYear,
            initMonth: this.initMonth,
            initDay: this.initDay,
            cancelCallback: this.cancelCallback,
            confirmCallback: this.confirmCallback,
            onChange: this.onChange,
            isShowDay: this.isShowDay,
          );
        });
  }
}

///自定义时间选择器
class CustomDatePickerDialog extends StatefulWidget {
  final BuildContext context;
  final int minYear;
  final int maxYear;
  final int initYear;
  final int initMonth;
  final int initDay;
  final DateCallback cancelCallback;
  final DateCallback confirmCallback;
  final DateCallback onChange;
  final bool isShowDay;

  CustomDatePickerDialog(
      {Key key,
      @required this.context,
      this.minYear: _minYear,
      this.maxYear: _maxYear,
      this.initYear,
      this.initMonth,
      this.initDay,
      this.cancelCallback,
      this.confirmCallback,
      this.onChange,
      this.isShowDay});

  @override
  State<StatefulWidget> createState() {
    return DatePickerDialogState(
        context: context,
        minYear: minYear,
        maxYear: maxYear,
        initYear: initYear,
        initMonth: initMonth,
        initDay: initDay,
        cancelCallback: cancelCallback,
        confirmCallback: confirmCallback,
        onChange: onChange,
        isShowDay: isShowDay);
  }
}

class DatePickerDialogState extends State<CustomDatePickerDialog> {
  BuildContext context;
  int minYear;
  int maxYear;
  int initYear;
  int initMonth;
  int initDay;
  DateCallback cancelCallback;
  DateCallback confirmCallback;
  DateCallback onChange;
  String dialogTitle;
  String cancelText;
  String confirmText;
  bool isShowDay;
  int typeCheck = 0;
  var states = [ISCHECKED, UNCHECKED];
  static final int UNCHECKED = 0;
  static final int ISCHECKED = 1;

  FixedExtentScrollController yearScrollController,
      monthScrollController,
      dayScrollController;
  int _dayCountOfMonth;

  DatePickerDialogState(
      {Key key,
      @required this.context,
      this.minYear,
      this.maxYear,
      this.initYear,
      this.initMonth,
      this.initDay,
      this.cancelCallback,
      this.confirmCallback,
      this.onChange,
      this.dialogTitle,
      this.cancelText,
      this.confirmText,
      this.isShowDay: _isShowDay});

  @override
  Widget build(BuildContext context) {
    initData();
    return Container(
      child: Column(
        children: <Widget>[
          _initTitle(),
          isShowDay
              ? Row(
                  children: <Widget>[_initYear(), _initMonth(), _initDay()],
                )
              : Row(
                  children: <Widget>[_initYear(), _initMonth()],
                ),
          _initFooter()
        ],
      ),
      margin:
          EdgeInsets.only(left: 40.0, right: 40.0, top: 150.0, bottom: 180.0),
      padding: EdgeInsets.only(top: 20.0),
      color: Colors.white,
    );
  }

  _initTitle() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            this.dialogTitle == null ? _dialogTitle : this.dialogTitle,
            style: TextStyle(fontSize: 22, color: Colors.black, inherit: false),
          ),
          Row(
            children: <Widget>[_initDateTypeLayout(0), _initDateTypeLayout(1)],
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  _initFooter() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: FlatButton(
              onPressed: () {
                _pressCancel();
              },
              child: Text(
                this.cancelText == null ? _cancelText : this.cancelText,
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
          ),
        ),
        Expanded(
          child: Container(
            child: FlatButton(
              onPressed: () {
                _pressConfirm();
              },
              child: Text(
                  this.confirmText == null ? _confirmText : this.confirmText,
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            ),
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
          ),
        )
      ],
    );
  }

  _initDateTypeLayout(int type) {
    return Expanded(
      child: Container(
        child: RaisedButton(
          onPressed: () {
            _changeDateType(type);
          },
          child: type == 0
              ? Text(
                  "月",
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  "日",
                  style: TextStyle(color: Colors.white),
                ),
          color: states[type] == ISCHECKED ? Colors.green : Colors.grey,
        ),
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
      ),
      flex: 1,
    );
  }

  _changeDateType(int type) {
    if (states[type] == ISCHECKED) {
      return;
    }
    setState(() {
      for (int i = 0; i < states.length; i++) {
        if (i == type) {
          states[i] = ISCHECKED;
          if (type == 0) {
            this.isShowDay = false;
          } else {
            this.isShowDay = true;
          }
        } else {
          states[i] = UNCHECKED;
        }
      }
    });
  }

  _pressConfirm() {
    if (confirmCallback != null) {
      confirmCallback(
          this.initYear, this.initMonth, this.initDay, this.isShowDay ? 1 : 0);
      Navigator.of(context).pop();
    }
  }

  _pressCancel() {
    if (cancelCallback != null) {
      cancelCallback(
          this.initYear, this.initMonth, this.initDay, this.isShowDay ? 1 : 0);
      Navigator.of(context).pop();
    }
  }

  ///在自定义控件之前初始化数据
  initData() {
    DateTime now = DateTime.now();
    if (initYear == null) {
      initYear = now.year;
    }
    if (initMonth == null) {
      initMonth = now.month;
    }
    if (initDay == null) {
      initDay = now.day;
    }
    if (this.initMonth < 1) {
      this.initMonth = 1;
    }
    if (this.initMonth > 12) {
      this.initMonth = 12;
    }

    if (this.initDay < 1) {
      this.initDay = 1;
    }
    if (this.initDay > 31) {
      this.initDay = 31;
    }
    yearScrollController =
        new FixedExtentScrollController(initialItem: initYear - this.minYear);
    monthScrollController =
        new FixedExtentScrollController(initialItem: initMonth - 1);
    dayScrollController =
        new FixedExtentScrollController(initialItem: initDay - 1);
    _dayCountOfMonth = _calcDateCount();
  }

  ///初始化年的布局
  _initYear() {
    return Expanded(
      child: Container(
        height: 300,
        child: CupertinoPicker(
          children: List.generate(maxYear - minYear + 1, (int index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                (minYear + index).toString() + "年",
                style: TextStyle(
                    color: Color(0xFF000046),
                    fontSize: 16,
                    inherit: false,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.start,
              ),
            );
          }),
          itemExtent: 50,
          scrollController: yearScrollController,
          onSelectedItemChanged: (int index) {
            _setYear(index);
          },
          backgroundColor: Colors.white,
        ),
      ),
      flex: 1,
    );
  }

  ///初始化月的布局
  _initMonth() {
    return Expanded(
      child: Container(
        height: 300,
        child: CupertinoPicker(
          children: List.generate(12, (int index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${index + 1}月',
                style: TextStyle(
                    color: Color(0xFF000046),
                    inherit: false,
                    fontSize: 16,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.start,
              ),
            );
          }),
          itemExtent: 50,
          backgroundColor: Colors.white,
          scrollController: monthScrollController,
          onSelectedItemChanged: (int index) {
            _setMonth(index);
          },
        ),
      ),
      flex: 1,
    );
  }

  ///初始化日的布局
  _initDay() {
    return Expanded(
      child: Container(
        height: 300,
        child: CupertinoPicker(
          children: List.generate(_calcDateCount(), (int index) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                '${index + 1}日',
                style: TextStyle(
                    color: Color(0xFF000046),
                    fontSize: 16,
                    inherit: false,
                    decoration: TextDecoration.none),
                textAlign: TextAlign.start,
              ),
            );
          }),
          itemExtent: 50,
          backgroundColor: Colors.white,
          scrollController: dayScrollController,
          onSelectedItemChanged: (int index) {
            _setDay(index);
          },
        ),
      ),
      flex: 1,
    );
  }

  ///计算当前选中月份的总天数
  int _calcDateCount() {
    if (leapYearMonths.contains(initMonth)) {
      return 31;
    } else if (initMonth == 2) {
      if ((initYear % 4 == 0 && initYear % 100 != 0) || initYear % 400 == 0) {
        return 29;
      }
      return 28;
    }
    return 30;
  }

  ///滑动设置年
  void _setYear(int index) {
    int year = widget.minYear + index;
    if (initYear != year) {
      initYear = year;
      if (initDay > _calcDateCount()) {
        initDay = _calcDateCount();
      }
      _notifyDateChanged();
    }
  }

  ///滑动设置月
  void _setMonth(int index) {
    int month = index + 1;
    if (initMonth != month) {
      initMonth = month;
      int dateCount = _calcDateCount();
      if (_dayCountOfMonth != dateCount) {
        setState(() {
          _dayCountOfMonth = dateCount;
        });
      }
      if (initDay > dateCount) {
        initDay = dateCount;
      }
      _notifyDateChanged();
    }
  }

  ///滑动设置日
  void _setDay(int index) {
    int date = index + 1;
    if (initDay != date) {
      initDay = date;
      _notifyDateChanged();
    }
  }

  ///更新界面
  void _notifyDateChanged() {
    if (widget.onChange != null) {
      widget.onChange(initYear, initMonth, initDay, isShowDay ? 1 : 0);
    }
  }
}

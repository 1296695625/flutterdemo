///日期格式化工具
class DateUtils {
  ///获取当前日期 格式是：yyyy-MM-dd
  static String getNowDate() {
    var dateTime = DateTime.now();
    return "${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  }

  ///根据yyyy-MM-dd 格式获取传入日期
  static String getDate(int year, int month, int day) {
    return "${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}";
  }
}

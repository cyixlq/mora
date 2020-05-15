
import 'package:mora/model/bean/Date.dart';

class DateUtil {
  static List<Date> getMonthDays(final int year, final int month) {
    final list = List<Date>();
    var dateTime = DateTime(year, month);
    final startCount = getWeekDay(year, month, 1); // 这个月1号星期几就拿上个月的尾巴补几天
    dateTime = dateTime.subtract(Duration(days: startCount)); // 星期几就往前推几天，拿上个月的尾巴补
    final curMonthDayCount = getDayCountOfMonth(year, month); // 当前月分有几天
    final lastDayWeekDay = getWeekDay(year, month, curMonthDayCount); // 这个月最后一天星期几
    final endCount = 6 - lastDayWeekDay; // 最后末尾拿下个月前几天来补
    for(int i = 0; i < (startCount + curMonthDayCount + endCount); i++) {
      final y = dateTime.year;
      final m = dateTime.month;
      final d = dateTime.day;
      final isInMonth = m == month;
      final date = Date(y, m, d, isInMonth, dateTime.millisecondsSinceEpoch);
      dateTime = dateTime.add(Duration(days: 1));
      list.add(date);
    }
    return list;
  }

  // 获取某年某月有多少天
  static int getDayCountOfMonth(int year, int month) {
    final arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (year % 4 == 0 && year % 100 != 0 || year % 100 == 0 && year % 400 == 0) { //为闰年的条件
      arr[1]++;
    }
    return arr[month - 1];
  }

  // 获取某年某月某天是星期几，星期天返回0，星期一返回1，以此类推
  static int getWeekDay(int year, int month, int day) {
    final date = DateTime(year, month, day);
    final result = date.weekday;
    return result == 7 ? 0 : result;
  }

  // 获取某一天0点整的时间戳
  static int getDayStartTimeStamp(int year, int month, int day) {
    final dateTime = DateTime(year, month, day);
    return dateTime.millisecondsSinceEpoch;
  }

  // 获取某一天0点整的DateTime
  static DateTime getDayStartTime(int year, int month, int day) {
    final dateTime = DateTime(year, month, day);
    return dateTime;
  }
}
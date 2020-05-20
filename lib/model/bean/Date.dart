
class Date {
  int id;
  int year;
  int month;
  int day;
  bool isInMonth;
  int timeStamp;
  bool isPunchIn = false; // 是否打卡

  Date(this.year, this.month, this.day, this.isInMonth, this.timeStamp, {this.isPunchIn, this.id});

  Map<String, dynamic> toMap() {
    return {
      "time": timeStamp,
      "year": year,
      "month": month,
      "day": day
    };
  }

  Date.fromMap(Map<String, dynamic> map) {
    timeStamp = map["time"];
    year = map["year"];
    month = map["month"];
    day = map["day"];
    id = map["id"];
  }
}
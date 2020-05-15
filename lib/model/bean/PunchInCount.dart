
class PunchInCount {
  int time;
  int count;
  final tag = "punch_in_count";

  Map<String, dynamic> toMap() {
    return {
      "time": time,
      "count": count,
      "tag": tag
    };
  }

  PunchInCount.fromMap(Map<String, dynamic> map) {
    time = map["time"];
    count = map["count"];
  }
}
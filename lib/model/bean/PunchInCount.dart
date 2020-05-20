
class PunchInCount {
  int id;
  int time;
  int count;
  final tag = "punch_in_count";

  PunchInCount(this.time, this.count, {this.id});

  Map<String, dynamic> toMap() {
    return {
      "time": time,
      "count": count,
      "tag": tag,
      "id": id
    };
  }

  PunchInCount.fromMap(Map<String, dynamic> map) {
    time = map["time"];
    count = map["count"];
    id = map["id"];
  }
}
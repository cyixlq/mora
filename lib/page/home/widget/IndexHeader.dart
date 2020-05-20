import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mora/model/DataBaseProvider.dart';
import 'package:mora/model/bean/Date.dart';
import 'package:mora/model/bean/PunchInCount.dart';
import 'package:mora/utils/DateUtil.dart';

class IndexHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexHeaderState();
}

class IndexHeaderState extends State<IndexHeader> {
  var _punchInCount = 0;
  bool _isPunchIn = false; // 今天是否已经打卡
  DataBaseProvider _provider;
  PunchInCount _punchInData;

  @override
  void initState() {
    super.initState();
    _provider = DataBaseProvider();
    _provider.getLastPunchIn().then((value) {
      var isPunchIn = false;
      var count = 0;
      if (value != null) {
        _punchInData = value;
        final DateTime nowTime = DateTime.now(); // 今天
        final DateTime startTime = DateUtil.getDayStartTime(nowTime.year, nowTime.month, nowTime.day); // 今天的开始时间
        final DateTime lastDay = nowTime.subtract(Duration(days: 1)); // 上一天
        final DateTime lastDayTime = DateUtil.getDayStartTime(lastDay.year, lastDay.month, lastDay.day); // 上一天0点整
        final DateTime dataTime = DateTime.fromMillisecondsSinceEpoch(value.time); // 上一次打卡时间
        isPunchIn = dataTime.isAfter(startTime);
        if (dataTime.isBefore(lastDayTime)) { // 如果上次打卡时间早于昨天0点整，说明昨天没有打卡，就是断签了
          value.count = 0;
          count = 0;
          _provider.updateLastPunchIn(value);
        } else {
          count = value.count;
        }
      }
      setState(() {
        _isPunchIn = isPunchIn;
        _punchInCount = count;
      });
    }).catchError((error) {
      Fluttertoast.showToast(msg: "${error.toString()}");
    }).whenComplete(() => _provider.close());
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 130,
        title: Text("首页"),
        elevation: 2,
        pinned: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.assignment_turned_in), onPressed: _punchIn, color: _isPunchIn ? Colors.blue : Colors.white,),
          IconButton(icon: Icon(Icons.help), onPressed: _showHelp)
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("static/images/bg_index_header.jpg", fit: BoxFit.cover),
          title: Text(
            "您已连续打卡$_punchInCount天",
            style: TextStyle(
              fontSize: 14
            ),
          ),
          centerTitle: true,
        )
    );
  }

  void _punchIn() {
    if (_isPunchIn) {
      Fluttertoast.showToast(msg: "您今天已经打过卡了！", gravity: ToastGravity.CENTER);
      return;
    }
    var punchDataIsNull = _punchInData == null;
    DateTime dateTime = DateTime.now();
    if (punchDataIsNull) {
      _punchInData = PunchInCount(dateTime.millisecondsSinceEpoch, 1, id: 1);
    } else {
      _punchInData.time = dateTime.millisecondsSinceEpoch;
      _punchInData.count++;
    }
    Date date = Date(dateTime.year, dateTime.month, dateTime.day, true,
        dateTime.millisecondsSinceEpoch);
    _provider.punchIn(_punchInData, date, punchDataIsNull).then((value) {
      if (value > 0) {
        Fluttertoast.showToast(msg: "打卡成功！加油，你能行的！", gravity: ToastGravity.CENTER);
        setState(() {
          _punchInCount++;
          _isPunchIn = true;
        });
      } else {
        Fluttertoast.showToast(msg: "出了点问题，打卡失败！", gravity: ToastGravity.CENTER);
      }
    }).catchError((error) => {
      Fluttertoast.showToast(msg: "出了点问题，打卡失败：${error.toString()}", gravity: ToastGravity.CENTER)
    }).whenComplete(() => _provider.close());
  }

  void _showHelp() {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text("帮助"),
                content: Text("只有在你昨天一整天没有撸管的情况下，你才能在今天进行打卡操作！"),
                actions: <Widget>[
                  FlatButton(onPressed: () => Navigator.of(context).pop(),
                      child: Text("我知道了"))
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                )
            )
    );
  }
}

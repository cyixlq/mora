import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mora/model/DataBaseProvider.dart';
import 'package:mora/utils/DateUtil.dart';

class IndexHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexHeaderState();
}

class IndexHeaderState extends State<IndexHeader> {
  var _punchInCount = 0;
  bool _isPunchIn = false; // 今天是否已经打卡
  DataBaseProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = DataBaseProvider();
    _provider.getLastPunchIn().then((value) {
      if (value != null) {
        final DateTime nowTime = DateTime.now();
        final DateTime startTime = DateUtil.getDayStartTime(nowTime.year, nowTime.month, nowTime.day);
        _isPunchIn = DateTime.fromMicrosecondsSinceEpoch(value.time).isAfter(startTime);
        _punchInCount = value.count;
      } else {
        _isPunchIn = false;
        _punchInCount = 0;
      }
    });
    _provider.close();
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
    Fluttertoast.showToast(
        msg: "打卡成功！加油，你能行的！",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    setState(() {
      _punchInCount++;
    });
  }

  void _showHelp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text("帮助"),
          content: Text("只有在你昨天一整天没有撸管的情况下，你才能在今天进行打卡操作！"),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.of(context).pop(), child: Text("我知道了"))
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          )
      )
    );
  }
}

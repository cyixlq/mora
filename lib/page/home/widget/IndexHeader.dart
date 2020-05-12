import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class IndexHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexHeaderState();
}

class IndexHeaderState extends State<IndexHeader> {
  var _punchInCount = 0;

  /*@override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "static/images/bg_index_header.jpg",
          fit: BoxFit.fitWidth,
        ),
        Column(
          children: <Widget>[
            Container(
              child: Text(
                  "今天你打卡了吗？",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                  )
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10, bottom: 10),
            ),
            Divider(
              height: 1,
              color: Colors.white,
            ),
            Container(
              child: Text(
                  "您已经连续打卡$_punchInCount天",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                  )
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20),
            ),
          ],
        ),
        Positioned(
          child: RaisedButton.icon(
            textColor: Colors.white,
            label: Text("打卡"),
            icon: Icon(Icons.add),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28)
            ),
            onPressed: _punchIn,
            color: Colors.blue,
            padding: EdgeInsets.only(left: 45, right: 45),
          ),
          bottom: 15,
        ),
      ],
      alignment: Alignment.topCenter,
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 200,
        title: Text("首页"),
        elevation: 2,
        pinned: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.assignment_turned_in), onPressed: _punchIn),
          IconButton(icon: Icon(Icons.help), onPressed: _showHelp)
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset("static/images/bg_index_header.jpg", fit: BoxFit.cover),
          title: Text(
            "您已连续打卡$_punchInCount天",
            style: TextStyle(
              fontSize: 16
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

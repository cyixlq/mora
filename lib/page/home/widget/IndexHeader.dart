
import 'package:flutter/material.dart';

class IndexHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexHeaderState();
}

class IndexHeaderState extends State<IndexHeader> {

  SnackBar _snackBar;
  var _punchInCount = 0;

  @override
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
  }

  void _punchIn() {
    if (_snackBar == null) {
      _snackBar = SnackBar(
        content: Text("打卡成功！加油，你能行的！"),
      );
    }
    Scaffold.of(context).showSnackBar(_snackBar);
    setState(() {
      _punchInCount++;
    });
  }

}
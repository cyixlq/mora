import 'package:flutter/material.dart';
import 'package:mora/page/home/widget/HistoryHeader.dart';

class HistoryFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryFragmentState();
}

class HistoryFragmentState extends State<HistoryFragment>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.blue,
          child:
              Text("记录", style: TextStyle(color: Colors.white, fontSize: 20)),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 10, bottom: 10),
        ),
        Expanded(
          child: HistoryHeader(),
          flex: 1,
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

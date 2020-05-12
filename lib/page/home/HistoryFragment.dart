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
    super.build(context);
    return Scaffold(
      appBar: AppBar(title: Text("记录")),
      body: HistoryHeader(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
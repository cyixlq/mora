import 'package:flutter/material.dart';
import 'package:mora/page/home/widget/IndexHeader.dart';

class IndexFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexFragmentState();
}

class IndexFragmentState extends State<IndexFragment> {

  SnackBar _snackBar;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          IndexHeader()
        ],
      ),
    );
  }
}
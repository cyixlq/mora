import 'package:flutter/material.dart';
import 'package:mora/model/bean/Date.dart';

class DateItem extends StatelessWidget {
  final Date date;
  DateItem(this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        date.day < 10 ? "0${date.day}" : date.day.toString(),
        style: TextStyle(
          color: date.isInMonth ? Colors.black : Colors.grey,
        ),
      ),
      alignment: Alignment.center,
    );
  }

}
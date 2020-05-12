import 'package:flutter/material.dart';
import 'package:mora/model/bean/Date.dart';
import 'package:mora/page/home/widget/DateItem.dart';
import 'package:mora/utils/DateUtil.dart';

class HistoryHeader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HistoryHeaderState();
}

class HistoryHeaderState extends State<HistoryHeader> {
  final _dateTime = DateTime.now();
  int _year;
  int _month;
  List<Date> _date;

  @override
  void initState() {
    super.initState();
    _year = _dateTime.year;
    _month = _dateTime.month;
    _date = DateUtil.getMonthDays(_year, _month);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildDateController(),
        _buildWeekDayItem(),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(child: child, scale: animation),
            child: GridView.builder(
              key: ValueKey<List<Date>>(_date),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
              ),
              itemBuilder: (context, index) => DateItem(_date[index]),
              itemCount: _date.length,
              padding: EdgeInsets.only(top: 0),
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _buildDateController() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => _lastOrNextMonth(true)),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: Text("$_year年${_month < 10 ? "0$_month" : _month}月"),
            alignment: Alignment.center,
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            child: IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => _lastOrNextMonth(false)),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _buildWeekDayItem() {
    final week = ["日", "一", "二", "三", "四", "五", "六"];
    return Row(
      children: week.map(
              (str) => Expanded(
                child: Container(
                  child: Text(str),
                  alignment: Alignment.center,
                ),
                flex: 1
              )
          ).toList()
    );
  }

  // 前移一个月或者后移一个月 isLast是否是前移一个月
  void _lastOrNextMonth(bool isLast) {
    int resultYear = _year, resultMonth = _month;
    if (isLast) {
      // 如果是前移一个月
      if (resultMonth == 1) {
        // 如果是1月份
        resultMonth = 12;
        resultYear--;
      } else {
        resultMonth--;
      }
    } else {
      if (resultMonth == 12) {
        resultYear++;
        resultMonth = 1;
      } else {
        resultMonth++;
      }
    }
    setState(() {
      _month = resultMonth;
      _year = resultYear;
      _date = DateUtil.getMonthDays(resultYear, resultMonth);
    });
  }
}

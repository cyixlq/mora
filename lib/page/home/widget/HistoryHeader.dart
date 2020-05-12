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
        Row(
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
        ),
        _buildWeekDayItem(),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemBuilder: (context, index) => _buildDateItem(_date[index]),
            itemCount: _date.length,
            padding: EdgeInsets.only(top: 0),
          ),
          flex: 1,
        ),
      ],
    );
  }

  Widget _buildDateItem(Date date) {
    return DateItem(date);
  }

  Widget _buildWeekDayItem() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Container(
              child: Text("日"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("一"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("二"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("三"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("四"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("五"),
              alignment: Alignment.center,
            ),
            flex: 1),
        Expanded(
            child: Container(
              child: Text("六"),
              alignment: Alignment.center,
            ),
            flex: 1),
      ],
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


import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {

  var title = "";
  var content = "";
  var author = "";
  int timeStamp;

  ArticleCard({Key key, this.title, this.content, this.timeStamp, this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(
                content,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 14
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(
                "——$author",
                style: TextStyle(
                  color: Colors.indigoAccent,
                  fontSize: 12
                ),
              ),
              padding: EdgeInsets.only(bottom: 10, right: 5),
              alignment: Alignment.bottomRight,
            )
          ],
        ),
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    );
  }

}
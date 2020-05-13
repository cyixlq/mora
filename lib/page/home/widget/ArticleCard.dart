
import 'package:flutter/material.dart';
import 'package:mora/model/bean/Article.dart';

class ArticleCard extends StatelessWidget {

  final Article article;

  ArticleCard(this.article, {Key key});

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
                article.title,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(
                article.content,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(
                "—— ${article.author}",
                style: TextStyle(
                  color: Color.fromARGB(255, 204, 204, 204),
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
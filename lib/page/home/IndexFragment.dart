import 'package:flutter/material.dart';
import 'package:mora/model/bean/Article.dart';
import 'package:mora/page/home/widget/ArticleCard.dart';
import 'package:mora/page/home/widget/IndexHeader.dart';

class IndexFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexFragmentState();
}

class IndexFragmentState extends State<IndexFragment> {
  final articles = <Article>[
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
    Article("撸管的危害", "众所周知，撸管对身体是有一定危害的，适当撸管能放松身体，但是过度撸管...", "D教授"),
    Article("年少不知精珍贵，老来望x空流泪", "大肆的撸管手淫将造成精子的产出与输出的不平衡...", "E教授"),
    Article("撸管好吗？", "万物过度皆是有害的，撸管也是如此，适当撸管能放松身心，过度则可能伤害身体...", "F教授"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          IndexHeader(),
          Container(
            padding: EdgeInsets.only(left: 12, top: 15, bottom: 12),
            child: Text(
              "精选文章",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemBuilder: (context, index) => _buildItem(articles[index]),
                itemCount: articles.length,
                padding: EdgeInsets.only(top: 0),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(Article item) {
    return ArticleCard(
        title: item.title, content: item.content, author: item.author);
  }
}

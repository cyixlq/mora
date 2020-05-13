import 'package:flutter/material.dart';
import 'package:mora/model/bean/Article.dart';
import 'package:mora/page/home/widget/ArticleCard.dart';
import 'package:mora/page/home/widget/IndexHeader.dart';

class IndexFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexFragmentState();
}

class IndexFragmentState extends State<IndexFragment> with AutomaticKeepAliveClientMixin {
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
    super.build(context);
    return CustomScrollView(
      slivers: <Widget>[
        IndexHeader(),
        SliverPersistentHeader(delegate: _SliverDelegate(), pinned: true),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ArticleCard(articles[index]),
                childCount: articles.length))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: Text("精选文章"),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10),
      color: Colors.white,
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

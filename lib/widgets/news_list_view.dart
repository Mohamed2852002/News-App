import 'package:flutter/material.dart';
import 'package:news/models/news_tile_model.dart';
import 'package:news/widgets/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.news});

  final List<NewsTileModel> news;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: news.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsTile(
              newsTileModel: news[index],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/models/news_tile_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsTileModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(news: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text('Oops There was an Error'),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
          );
        }
      },
    );
  }
}

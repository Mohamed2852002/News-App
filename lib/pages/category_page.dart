import 'package:flutter/material.dart';
import 'package:news/widgets/news_list_view_builder.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('News'),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          slivers: [
            NewsListViewBuilder(category: category),
          ],
        ),
      ),
    );
  }
}

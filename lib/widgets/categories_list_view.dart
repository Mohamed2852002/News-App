import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/category.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> cards = const [
    CategoryModel(
      imageUrl: 'assets/general.avif',
      categoryName: 'General',
    ),
    CategoryModel(
      imageUrl: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(
      imageUrl: 'assets/health.avif',
      categoryName: 'Health',
    ),
    CategoryModel(
      imageUrl: 'assets/sports.avif',
      categoryName: 'Sports',
    ),
    CategoryModel(
      imageUrl: 'assets/technology.jpeg',
      categoryName: 'Technology',
    ),
    CategoryModel(
      imageUrl: 'assets/science.avif',
      categoryName: 'Science',
    ),
    CategoryModel(
      imageUrl: 'assets/business.jpeg',
      categoryName: 'Business',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) => CategoryWidget(model: cards[index]),
      ),
    );
  }
}

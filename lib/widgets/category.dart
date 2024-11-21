import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/pages/category_page.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (conrext) =>  CategoryPage(category: model.categoryName,)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 100,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(model.imageUrl),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              model.categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

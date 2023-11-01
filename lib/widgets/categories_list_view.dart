import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.jpg', categoryName: 'business'),
    CategoryModel(image: 'assets/science.jpg', categoryName: 'science'),
    CategoryModel(image: 'assets/sports.jpg', categoryName: 'sports'),
    CategoryModel(image: 'assets/technology.jpg', categoryName: 'technology'),
    CategoryModel(image: 'assets/general.avif', categoryName: 'general'),
    CategoryModel(image: 'assets/health.jpg', categoryName: 'health'),
    CategoryModel(image: 'assets/entertainment.jpg', categoryName: 'entertainment'),


  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categories[index],
          );
        },
      ),
    );
  }
}

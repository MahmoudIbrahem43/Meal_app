import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
static const routeName='/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CategoryItem(
              id: DUMMY_CATEGORIES[index].id,
              title: DUMMY_CATEGORIES[index].title,
              color: DUMMY_CATEGORIES[index].color);
        },
        itemCount: DUMMY_CATEGORIES.length,
      ),
    );
  }
}

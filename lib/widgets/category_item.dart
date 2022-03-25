import 'package:flutter/material.dart';
import 'package:meal_app2/screens/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  String id;
  String title;
  Color color;

  CategoryItem({required this.id, required this.title, required this.color});

  void selectCateogry(BuildContext ctx) {
    Navigator.pushNamed(ctx, CategoryMealScreen.routName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          selectCateogry(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [color.withOpacity(.8), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
            child: Text(title,
                style: const TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}

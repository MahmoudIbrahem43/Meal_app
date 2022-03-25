import 'package:flutter/material.dart';
import 'package:meal_app2/screens/category_meal_screen.dart';
import 'package:meal_app2/screens/filters_screen.dart';

import 'package:meal_app2/screens/meal_detail_screen.dart';

import 'screens/tabs_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.orange,
        canvasColor: const Color.fromRGBO(225, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 50, 50, 1),
              ),
              headline1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealScreen.routName: (context) => CategoryMealScreen(),
        MealDetails.routeName: (context) => MealDetails(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
    );
  }
}

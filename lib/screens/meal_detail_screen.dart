import 'package:flutter/material.dart';
import 'package:meal_app2/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = 'meal_Detail';

  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context)?.settings;
    Map<String, String> myMap = routeArg?.arguments as Map<String, String>;
    final mealId = myMap['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              child: const Text(
                'Ingredients',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            height: 150,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              child: const Text(
                'Steps',
                style: TextStyle(
                    fontFamily: 'RobotoCondensed',
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            height: 150,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('#${index + 1}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(
                        color: Colors.grey.withOpacity(.2),
                      )
                    ],
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

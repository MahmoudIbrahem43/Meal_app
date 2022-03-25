import 'package:flutter/material.dart';
import 'package:meal_app2/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordable;
  final String imageUrl;
  MealItem(
      {required this.id,
      required this.imageUrl,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordable});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  String get affordableText {
    switch (affordable) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealDetails.routeName, arguments:{
      'id':id
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('$duration' ' min'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(affordableText),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

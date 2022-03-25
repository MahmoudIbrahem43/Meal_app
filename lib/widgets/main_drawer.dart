import 'package:flutter/material.dart';
import 'package:meal_app2/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext context, String title, Icon icon, VoidCallback tabHandler) {
    return ListTile(
      onTap: tabHandler,
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 120,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                'Cooking Up! ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildListTile(
                context,
                'Meal',
                const Icon(
                  Icons.restaurant,
                  size: 30,
                ), () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            buildListTile(
                context,
                'Filters',
                const Icon(
                  Icons.settings,
                  size: 30,
                ), () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }
}

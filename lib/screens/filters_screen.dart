import 'package:flutter/material.dart';
import 'package:meal_app2/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('filters')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: const Text(
              'Adjust your meal selection.',
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            SwitchListTile(
                title: const Text('Gluteen-free'),
                subtitle: Text('Only include gluteen-free meals'),
                value: _glutenFree,
                onChanged: (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
            SwitchListTile(
                title: const Text('Lactose-free'),
                subtitle: Text('Only include lactose-free meals'),
                value: _lactoseFree,
                onChanged: (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
            SwitchListTile(
                title: const Text('Vegan'),
                subtitle: const Text('Only include vegan meals'),
                value: _vegan,
                onChanged: (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
            SwitchListTile(
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include vegetarian meals'),
                value: _isVegetarian,
                onChanged: (value) {
                  setState(() {
                    _isVegetarian = value;
                  });
                }),
          ],
        ))
      ]),
      drawer: MainDrawer(),
    );
  }
}

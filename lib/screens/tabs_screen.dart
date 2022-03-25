import 'package:flutter/material.dart';
import 'package:meal_app2/screens/category_screen.dart';
import 'package:meal_app2/screens/favouritScreen.dart';
import 'package:meal_app2/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, dynamic>> _pages;
  int selectPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouritScreen(),
        'title': 'Favourit',
      },
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      selectPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectPageIndex]['title']),
      ),
      body: _pages[selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        currentIndex: selectPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourit'),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}

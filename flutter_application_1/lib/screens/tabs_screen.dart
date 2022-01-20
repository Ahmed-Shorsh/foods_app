import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './catagories_screen.dart';
import './favoriates_screen.dart';
import '../models/meals.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favMeals;
  Tabs(this.favMeals);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late List<Map<String, dynamic>> pages;
  @override
  initState() {
   pages = [
    {
      'page': CatagoriesScreen(),
      'title': 'catagory',
    },
    {// we have to put widget. inside an initSate becase we cannot set a property as property insite the class State.
      'page': Favs(widget.favMeals),
      'title': 'favorate',
    }
  ];
    super.initState();
  }

  int indexx = 0;
  void tapped(int index) {
    setState(() {
      indexx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pages[indexx]['title'])),
      drawer: MainDrawer(),
      body: pages[indexx]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: tapped,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: indexx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favorits',
          ),
        ],
      ),
    );
  }
}

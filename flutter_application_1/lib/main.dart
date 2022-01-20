import 'package:flutter/material.dart';
import 'package:flutter_application_1/dummy_data.dart';
import '../screens/fliters_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/meals_detail_screen.dart';
import 'screens/meals_catagory_screen.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // you make a class for it in the models
  Map<String, bool> filtersBefore = {
    'glutenFree': false,
    'veganFree': false,
    'vegeFree': false,
    'lactosFree': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void setFilters(Map<String, bool> filtered) {
    setState(() {
      filtersBefore = filtered;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (filtersBefore['glutenFree']! && !element.isGlutenFree) {
          return false;
        }
        if (filtersBefore['veganFree']! && !element.isVegan) {
          return false;
        }
        if (filtersBefore['vegeFree']! && !element.isVegetarian) {
          return false;
        }
        if (filtersBefore['lactosFree']! && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

   final List<Meal> _favMeals = [];

  void _toggleFav(String mealId) {
    final indexState = _favMeals.indexWhere((meal) => meal.id == mealId);
    if (indexState >= 0) {
      setState(() {
        _favMeals.removeAt(indexState);
      });
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavorate(String id) {
    return _favMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
          accentColor: Colors.orange,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              headline6: const TextStyle(
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => Tabs(_favMeals),
        MealsCat.screenName: (ctx) => MealsCat(_availableMeals),
        MealDetails.screenName: (ctx) => MealDetails(_toggleFav, isFavorate),
        Filters.screenName: (ctx) => Filters(filtersBefore, setFilters),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => MealsCat(_availableMeals),
        );
      }, // this is my fallback if my app crashes
    );
  }
}

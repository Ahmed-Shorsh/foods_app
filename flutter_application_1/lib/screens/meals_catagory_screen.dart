import 'package:flutter/material.dart';
import '../widgets/items_meals.dart';
import '../dummy_data.dart';
import '../models/meals.dart';

class MealsCat extends StatefulWidget {
  static const screenName = '/meals-screen';

  final List<Meal> availableMeal;
  MealsCat(this.availableMeal);

  @override
  State<MealsCat> createState() => _MealsCatState();
}

class _MealsCatState extends State<MealsCat> {
  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  // @override
  // void initState() {
  //   // ...
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routArgs['title'].toString();
      final catagoryId = routArgs['id'];

      displayedMeals = widget.availableMeal.where((element) {
        return element.categories.contains(catagoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        // bcs we dont know how many recipes will be there.
        itemBuilder: (context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageURL: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

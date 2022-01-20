import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/items_meals.dart';

class Favs extends StatelessWidget {
  final List<Meal> favMeals;
  Favs(this.favMeals);

  @override
  Widget build(BuildContext context) {
    if (favMeals.isEmpty) {
      return Center(
        child: Text('is empty'),
      );
    } else {
      return ListView.builder(
        // bcs we dont know how many recipes will be there.
        itemBuilder: (context, index) {
          return MealItem(
            id: favMeals[index].id,
            title: favMeals[index].title,
            imageURL: favMeals[index].imageUrl,
            duration: favMeals[index].duration,
            affordability: favMeals[index].affordability,
            complexity: favMeals[index].complexity,
          );
        },
        itemCount: favMeals.length,
      );
    }
  }
}

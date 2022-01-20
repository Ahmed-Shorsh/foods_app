import 'package:flutter/material.dart';
import '../screens/meals_catagory_screen.dart';

class ItemsCatagory extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  ItemsCatagory(this.id, this.title, this.color);

  void tapCatgories(BuildContext ctx) {
    Navigator.of(ctx).pushNamed( // navigator works like a FILO list to navigate the pages.
      MealsCat.screenName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tapCatgories(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.bodyText1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}

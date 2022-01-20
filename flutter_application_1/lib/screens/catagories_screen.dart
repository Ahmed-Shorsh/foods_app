import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/items_catagory.dart';

class CatagoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((catData) {
          return ItemsCatagory(
            catData.id,
            catData.title,
            catData.color,
          );
        }).toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              200, // how many columns in the crossAxis: here we say if the device size is only 200 then have only one column, if the device size is 500 then lets have 2 columns.
          childAspectRatio: 3 / 2, // for 200 width I want 300 height.
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
    );
  }
}

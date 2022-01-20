import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class Filters extends StatefulWidget {
  static const screenName = '/filters';
  final Function saveFiltered;
  final Map<String, bool> filtersBefore;
  Filters(this.filtersBefore, this.saveFiltered);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var gluFree = false;
  var veganFree = false;
  var vegeFree = false;
  var lactosFree = false;

  @override
  initState() {
    gluFree = widget.filtersBefore['glutenFree']!;
    veganFree = widget.filtersBefore['veganFree']!;
    vegeFree = widget.filtersBefore['vegeFree']!;
    lactosFree = widget.filtersBefore['lactosFree']!;

    super.initState();
  }

  

  Widget buildSwitchCases(String title, String subTitle, bool currentValue,
      Function(bool) changedVal) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: changedVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
        actions: [
          IconButton(
            onPressed: () {
              final yes = {
                'glutenFree': gluFree,
                'veganFree': veganFree,
                'vegeFree': vegeFree,
                'lactosFree': lactosFree,
              };
              widget.saveFiltered(yes);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection: ',
                style: Theme.of(context).textTheme.headline6),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchCases(
                    'Gluten-Free', 'only include gluten free meals.', gluFree,
                    (newValue) {
                  setState(() {
                    gluFree = newValue;
                  });
                }),
                buildSwitchCases(
                    'Vegan-Free', 'only include Vegan free meals.', veganFree,
                    (newValue) {
                  setState(() {
                    veganFree = newValue;
                  });
                }),
                buildSwitchCases(
                    'Vege-Free', 'only include Vege free meals.', vegeFree,
                    (newValue) {
                  setState(() {
                    vegeFree = newValue;
                  });
                }),
                buildSwitchCases('Lactos-Free',
                    'only include Lactos free meals.', lactosFree, (newValue) {
                  setState(() {
                    lactosFree = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

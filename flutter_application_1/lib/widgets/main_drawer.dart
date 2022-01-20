import 'package:flutter/material.dart';
import '../screens/fliters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function()? go) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: go,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).colorScheme.secondary,
            child: const Center(
              child: Text(
                'lets get coocking',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
          ),
          buildListTile(Icons.category, 'category', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.settings, 'filters', () {
            Navigator.of(context).pushReplacementNamed(Filters.screenName); // unlike the pushNamed(), this one doesn't add on top of the stack but rather replaces the old page with a new page. especially for login page (you dont want to go back to the login page after logging in).
          }),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_v2/screens/filters.dart';
class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            padding: EdgeInsets.all(20),
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text("Cooking up!",style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 35,
              color: Colors.pink,
            ),),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: (){Navigator.of(context).pushReplacementNamed('/');},
            leading: Icon(Icons.restaurant),
            title: Text("Meal",style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
          ),
          ListTile(
            onTap: (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);},
            leading: Icon(Icons.settings),
            title: Text("Filters",style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),),
          ),
        ],
      ),
    );
  }
}

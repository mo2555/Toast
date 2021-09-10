import 'package:flutter/material.dart';
import 'package:meal_app_v2/widgets/drawer.dart';

import 'category_screen.dart';
import 'fav_screen.dart';

class TapsScreen extends StatefulWidget {
  final favorite;
  TapsScreen(this.favorite);
  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  List pages;
  initState(){
    setState(() {
      pages = [
        {
          'page':CategoryScreen(),
          'title':'Category'
        },
        {
          'page':FavoritesScreen(widget.favorite),
          'title':'Favorites'
        },
      ];
    });
    super.initState();
  }
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currentIndex]['title']),
      ),
      body: pages[currentIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 12,
        backgroundColor: Theme.of(context).primaryColor,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

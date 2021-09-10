import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
final favorite;
FavoritesScreen(this.favorite);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: favorite.length,
          itemBuilder: (ctx,index) {
            return MealItem(
              imageUrl: favorite[index].imageUrl,
              title: favorite[index].title,
              affordability: favorite[index].affordability,
              id: favorite[index].id,
              complexity: favorite[index].complexity,
              duration: favorite[index].duration,
            );
          }),
    );
  }
}

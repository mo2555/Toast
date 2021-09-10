import 'package:flutter/material.dart';
import 'package:meal_app_v2/screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
  selectedCategory(ctx){
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id':id,
        'title':title,
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectedCategory(context);
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
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

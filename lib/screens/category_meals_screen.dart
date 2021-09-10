import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app_v2/dummy_data1.dart';
import 'package:meal_app_v2/widgets/meal_item.dart';
class CategoryMealScreen extends StatefulWidget {
static final routeName = 'category_meal_screen';
final List availableMeal;
CategoryMealScreen(this.availableMeal);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map;
    final routeID = routeArg['id'];
    final routeTitle = routeArg['title'];
    final List CategoryMeal = widget.availableMeal.where((meal){
      return meal.categories.contains(routeID);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(routeTitle),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
      itemCount: CategoryMeal.length,
      itemBuilder: (ctx,index) {
        return MealItem(
         imageUrl: CategoryMeal[index].imageUrl,
          title: CategoryMeal[index].title,
          affordability: CategoryMeal[index].affordability,
          id: CategoryMeal[index].id,
          complexity: CategoryMeal[index].complexity,
          duration: CategoryMeal[index].duration,
        );
      }),
    );
  }
}

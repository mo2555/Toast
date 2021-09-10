import 'package:flutter/material.dart';
import 'package:meal_app_v2/dummy_data1.dart';

class MealDetailScreen extends StatelessWidget {
  static final routeName = 'meal_detail_screen';
final setFavorite;
final isMealFav;
MealDetailScreen(this.setFavorite,this.isMealFav);

  @override
  Widget build(BuildContext context) {
    int i = 0;
    final String routeId = ModalRoute.of(context).settings.arguments;
    final mealDetail = DUMMY_MEALS.firstWhere((meal){
      return meal.id==routeId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Image.network(mealDetail.imageUrl,fit: BoxFit.cover,),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              child: Text("Ingredients",style: Theme.of(context).textTheme.title,),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border:Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 150,
              width: 300,
              child: ListView(
                children: mealDetail.ingredients.map((meal) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(meal),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              child: Text("Steps",style: Theme.of(context).textTheme.title,),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border:Border.all(color: Colors.grey,),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 150,
              width: 300,
              child: ListView(
                children: mealDetail.steps.map((meal) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("#${++i}"),
                        ),
                        title: Text(meal),
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFav(routeId)?Icons.star:Icons.star_border),
        onPressed: (){
         setFavorite(routeId);
        },
      ),
    );
  }
}

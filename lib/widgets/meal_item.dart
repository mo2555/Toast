import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String id;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.imageUrl,
    @required this.title,
    @required this.id,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityText{
    switch(complexity){
      case Complexity.Simple : return 'Simple' ; break;
      case Complexity.Challenging : return 'Challenging' ; break;
      case Complexity.Hard : return 'Hard' ; break;
      default :
        return 'UnKnow';
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable : return 'Affordable' ; break;
      case Affordability.Luxurious : return 'Luxurious' ; break;
      case Affordability.Pricey : return 'Pricey' ; break;
      default :
        return 'UnKnow';
    }
  }
  selectedMeal(ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments:
        id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectedMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    color: Colors.black26,
                    child: Text(title,style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alarm,),
                      SizedBox(
                        width: 4,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,),
                      SizedBox(
                        width: 4,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,),
                      SizedBox(
                        width: 4,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

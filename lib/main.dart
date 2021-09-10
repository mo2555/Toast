import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import './dummy_data1.dart';
import './models/meal.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/taps_screen.dart';
import './screens/filters.dart';
main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  List availableMeal= DUMMY_MEALS;
  setFilters(Map filtersData){
  setState(() {
    filters = filtersData;
  availableMeal = DUMMY_MEALS.where((meal) {
    if(filters['gluten']&&!meal.isGlutenFree)
      return false;
    if(filters['lactose']&&!meal.isLactoseFree)
      return false;
    if(filters['vegan']&&!meal.isVegan)
      return false;
    if(filters['vegetarian']&&!meal.isVegetarian)
      return false;
    return true;
  }).toList();
  });
  if(!filters['gluten']&&!filters['vegetarian']&&!filters['vegan']&&!filters['lactose'])
    Fluttertoast.showToast(msg: "You did not choice any filters");
  else
    Fluttertoast.showToast(msg: "Saved");
  }
  List<Meal> favorite=[

  ];
  setFavorite(String mealId){
    setState(() {
      int favIndex = favorite.indexWhere((meal) {
       return meal.id == mealId;
      });
      if(favIndex>=0)
        favorite.removeAt(favIndex);
      else{
        favorite.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    });
  }
  isMealFavorite(String mealId){
    return favorite.any((meal) => meal.id == mealId);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>TapsScreen(favorite),
        CategoryMealScreen.routeName:(context)=>CategoryMealScreen(availableMeal),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(setFavorite,isMealFavorite),
        FiltersScreen.routeName:(context)=>FiltersScreen(setFilters: setFilters,filters: filters,),
      },
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 255, 222,1),
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: TextTheme(
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: null,
    );
  }
}


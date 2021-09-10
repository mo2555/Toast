import 'package:flutter/material.dart';
import 'package:meal_app_v2/widgets/drawer.dart';
class FiltersScreen extends StatefulWidget {
static final routeName = 'filters';
final Function setFilters;
final Map filters;
   FiltersScreen({@required this.setFilters, @required this.filters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

bool isGlutenFree = false;
bool isLactoseFree = false;
bool isVegan = false;
bool isVegetarian = false;
@override
  void initState() {
    isGlutenFree = widget.filters['gluten'];
    isLactoseFree = widget.filters['lactose'];
    isVegan = widget.filters['vegan'];
    isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }
Map filters;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: (){
                setState(() {
                  filters={
                    'gluten':isGlutenFree,
                    'lactose':isLactoseFree,
                    'vegan':isVegan,
                    'vegetarian':isVegetarian,
                  };
                });
             widget.setFilters(filters);
              }
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.title,
            ),
            padding: EdgeInsets.all(20),
          ),
          Expanded(
            child: ListView(
              children:[
                SwitchListTile(
                  title: Text("Gluten-Free"),
                  subtitle: Text("Only include Gluten-Free meals."),
                  value:isGlutenFree ,
                  onChanged: (value){
                   setState(() {
                     isGlutenFree=value;
                   });
                  },
               ),
                SwitchListTile(
                  title: Text("Lactose-Free"),
                  subtitle: Text("Only include Lactose-Free meals."),
                  value:isLactoseFree ,
                  onChanged: (value){
                    setState(() {
                      isLactoseFree=value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegan"),
                  subtitle: Text("Only include Vegan meals."),
                  value:isVegan ,
                  onChanged: (value){
                    setState(() {
                      isVegan=value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text("Vegetarian"),
                  subtitle: Text("Only include Vegetarian meals."),
                  value:isVegetarian ,
                  onChanged: (value){
                    setState(() {
                      isVegetarian=value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}

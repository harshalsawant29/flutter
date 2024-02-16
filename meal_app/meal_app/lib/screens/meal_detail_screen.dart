import 'package:flutter/material.dart';
import '/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite, this.isFavourite);

  Widget buildSectionTItle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTItle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
              ),
            ),
            buildSectionTItle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                  itemBuilder: ((context, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('${(index + 1)}'),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                            ),
                          ),
                          Divider(thickness: 2),
                        ],
                      )),
                  itemCount: selectedMeal.steps.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}

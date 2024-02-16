import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'category_meals_screens.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favourites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouriteMeals[index].id,
              title: favouriteMeals[index].title,
              imageUrl: favouriteMeals[index].imageUrl,
              affordability: favouriteMeals[index].affordability,
              complexity: favouriteMeals[index].complexity,
              duration: favouriteMeals[index].duration);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}

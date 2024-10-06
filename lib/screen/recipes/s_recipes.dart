import 'package:blend_buddy/general/drinkBox/w_add_today_drink.dart';
import 'package:blend_buddy/screen/home/myRecipes/w_drinks_record_appBar.dart';
import 'package:flutter/material.dart';

import '../home/myRecipes/w_searchBar.dart';
import '../home/todaysConsumedDrinks/myRecipes_drinkBox.dart';
import '../home/todaysConsumedDrinks/stored_myRecipes_drinks_list.dart';
import 'package:provider/provider.dart';


class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DrinksRecordAppBar(),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RecipeSearchBar(),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: myRecipeStoredDrinks.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final drink = myRecipeStoredDrinks[index];
                    return Column(
                      children: [
                        MyRecipeDrinkBox(
                            drink: drink,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddTodayDrinkPage(drink: drink)));
                            },
                        showDeleteButton: true,
                            onDeletePressed: () {
                              // 내 레시피 음료 삭제
                        },
                        ),
                        SizedBox(height: 10),

                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

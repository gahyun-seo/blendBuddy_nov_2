import 'package:blend_buddy/general/drinkBox/drinks_dummy.dart';
import 'package:blend_buddy/general/drinkBox/w_drinkBox.dart';
import 'package:blend_buddy/general/drinkBox/w_theme.dart';
import 'package:blend_buddy/screen/community/detail/nutrition/nutrition_dummy.dart';
import 'package:blend_buddy/screen/community/detail/nutrition/w_detail_recipe_drinkBox.dart';
import 'package:blend_buddy/screen/community/detail/nutrition/w_nutrition_table.dart';
import 'package:blend_buddy/screen/community/detail/recipe_post_dummy.dart';
import 'package:blend_buddy/screen/community/detail/w_detail_recipe_appBar.dart';
import 'package:blend_buddy/screen/community/detail/content/w_detail_recipe_content.dart';
import 'package:blend_buddy/screen/community/detail/header/w_profile_image_button.dart';
import 'package:flutter/material.dart';

import 'header/w_detail_recipe_header.dart';

// 커뮤니티 페이지 유저 사진 클릭 시 나오는 페이지

class DetailRecipePage extends StatefulWidget {
  const DetailRecipePage({super.key});

  @override
  State<DetailRecipePage> createState() => _DetailRecipePageState();
}

class _DetailRecipePageState extends State<DetailRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(67),
        child: DetailRecipeAppBar(),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: 0,
          bottom: 0,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 34, right: 34),
              child: DetailRecipeHeader(recipePost1),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 35, right: 35),
              child: DetailRecipeContent(recipePost1),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: DetailRecipeDrinkBox(dolceColdBrew),
            ),
            SizedBox(height: 10,),
            NutritionTable(nutritionSample),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

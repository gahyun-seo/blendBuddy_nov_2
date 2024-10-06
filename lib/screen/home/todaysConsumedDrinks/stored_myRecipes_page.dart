import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/home/myRecipes/w_searchBar.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/myRecipes_drinkBox.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/stored_myRecipes_drinks_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoredMyRecipesDrinksPage extends StatefulWidget {
  const StoredMyRecipesDrinksPage({super.key});

  @override
  _StoredMyRecipesDrinksPageState createState() =>
      _StoredMyRecipesDrinksPageState();
}

class _StoredMyRecipesDrinksPageState extends State<StoredMyRecipesDrinksPage> {
  String selectedCategory = '내 레시피'; // 초기 선택된 카테고리
  double indicatorLeftMargin = 0; // 인디케이터의 초기 마진 설정

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.5; // 버튼 너비
    double indicatorWidth = buttonWidth * 0.25;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '음료 추가하기',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: RecipeSearchBar(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('내 레시피', (buttonWidth - indicatorWidth) / 2),
                _buildCategoryButton('STARBUCKS', buttonWidth + (buttonWidth - indicatorWidth) / 2),
              ],
            ),
            Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  margin: EdgeInsets.only(left: indicatorLeftMargin == 0 ? (buttonWidth - indicatorWidth) / 2 : indicatorLeftMargin),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 2,
                    width: indicatorWidth, // 인디케이터의 너비
                    color: mainColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildContentForSelectedCategory(),
          ],
        ),
      ),
    );
  }


  Widget _buildContentForSelectedCategory() {
    // 선택된 카테고리에 따른 컨텐츠 표시
    if (selectedCategory == 'STARBUCKS') {
      return _buildStarbucksView();
    } else {
      return _buildMyRecipesView();
    }
  }

  Widget _buildMyRecipesView() {
    return Center(
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
                      Navigator.pop(context, drink);
                    }),
                SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildStarbucksView() {
    // Starbucks에 대한 커스텀 뷰 구현
    return Center(
      child: Text("Starbucks 음료 목록"),
    );
  }
  Widget _buildCategoryButton(String category, double leftMargin) {
    bool isSelected = selectedCategory == category;

    return Expanded(
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedCategory = category;
            indicatorLeftMargin = leftMargin; // 인디케이터 위치 변경
          });
        },
        style: TextButton.styleFrom(
          foregroundColor: isSelected ? mainColor : Colors.grey,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(category),
      ),
    );
  }
}

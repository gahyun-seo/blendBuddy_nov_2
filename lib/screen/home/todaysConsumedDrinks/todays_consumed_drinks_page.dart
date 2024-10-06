import 'package:blend_buddy/general/text_button_box.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/myRecipes_drinkBox.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/stored_myRecipes_page.dart';
import 'package:blend_buddy/screen/home/todaysConsumedDrinks/todays_consumed_drink_list.dart';
import 'package:flutter/material.dart';

import '../../../general/drinkBox/w_add_today_drink.dart';
import '../../../general/w_theme.dart';
import 'package:provider/provider.dart';

class TodaysConsumedDrinksFragment extends StatefulWidget {
  const TodaysConsumedDrinksFragment({super.key});

  @override
  State<TodaysConsumedDrinksFragment> createState() =>
      _TodaysConsumedDrinksFragmentState();
}

class _TodaysConsumedDrinksFragmentState
    extends State<TodaysConsumedDrinksFragment> {
  // 오늘 마신 음료 넘길 때 나오는 Status bar를 위한 scrollController

  final ScrollController _scrollController = ScrollController();
  int _currentDrinkIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateCurrentIndex);
  }

  void _updateCurrentIndex() {
    double itemWidth = MediaQuery.of(context).size.width * 0.9; // 정확한 아이템 너비 + 여백
    int newCurrentIndex = (_scrollController.position.pixels / itemWidth).round();

    if (_currentDrinkIndex != newCurrentIndex) {
      setState(() {
        _currentDrinkIndex = newCurrentIndex;
      });
    }
  }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final drinkList = Provider.of<TodaysConsumedDrinkList>(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          drinkList.drinks.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '오늘 마신 음료',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      // 음료 추가 버튼
                      Container(
                        width: 29.7,
                        height: 20.99,
                        child: IconButton(
                          onPressed: () async {
                            // 저장된 내 레시피 페이지로 이동하고 선택된 음료를 받아옴
                            final selectedDrink = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      StoredMyRecipesDrinksPage(),
                                ));
                            // 선택된 음료가 있을 경우 음료 목록에 추가
                            if (selectedDrink != null) {
                              final detailedDrink = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AddTodayDrinkPage(drink: selectedDrink),
                                ),
                              );
                              if (detailedDrink != null) {
                                drinkList.addDrink(detailedDrink);
                              }
                            }
                          },
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.add_circle,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          drinkList.drinks.isEmpty
              ? Center(
                  child: TextButtonBox(
                    text: "오늘 마신 음료 추가하기   + ",
                    width: 210,
                    height: 42,
                    textColor: Colors.white,
                    backgroundColor: mainColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    onPressed: () async {
                      // 저장된 내 레시피 페이지로 이동하고 선택된 음료를 받아옴
                      final selectedDrink = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoredMyRecipesDrinksPage(),
                          ));
                      // 선택된 음료가 있을 경우 음료 목록에 추가
                      if (selectedDrink != null) {
                        final detailedDrink = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddTodayDrinkPage(drink: selectedDrink),
                          ),
                        );
                        if (detailedDrink != null) {
                          drinkList.addDrink(detailedDrink);
                        }
                      }
                    },
                  ),
                )
              : Container(
                  //padding: EdgeInsets.only(top: 10),
                  height: 150.6,
                  //margin: EdgeInsets.symmetric(horizontal: 14),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                        child: Expanded(
                      child: ListView.builder(
                        key: PageStorageKey<String>('drinksListView'),
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: drinkList.drinks.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // 가장 최신으로 등록한 음료가 먼저 보이게 함
                          final drink =
                              drinkList.drinks.reversed.toList()[index];
                          return Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                height: 140,
                                child: MyRecipeDrinkBox(
                                  drink: drink,
                                  onTap: () {
                                    // 음료 버튼 클릭 시 상세 페이지로 이동
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AddTodayDrinkPage(drink: drink)),
                                    );
                                  },
                                  showDeleteButton: true,
                                  onDeletePressed: () {
                                    drinkList.removeDrink(drink); // 추가된 음료를 삭제한다
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          );
                        },
                      ),
                    )),
                  ),
                ),
          SizedBox(height: 30),
          drinkList.drinks.isNotEmpty
              ? StatusBar(
                  currentIndex: _currentDrinkIndex,
                  itemCount: drinkList.drinks.length)
              : Container(),
        ],
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final int currentIndex; // 현재 선택된 인덱스
  final int itemCount; // 전체 아이템 개수

  const StatusBar(
      {super.key, required this.currentIndex, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(itemCount, (index) { // itemCount에 따라 원 생성
          return Container(
            width: 7,
            height: 7,
            margin: const EdgeInsets.symmetric(horizontal: 3.5), // 원 사이 간격
            decoration: BoxDecoration(
              color: index == currentIndex ? Colors.pink : Colors.grey, // 현재 인덱스에 따라 색상 변경
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
    );
  }
}

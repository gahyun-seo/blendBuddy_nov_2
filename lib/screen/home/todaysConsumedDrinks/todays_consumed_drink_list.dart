import 'package:flutter/material.dart';

import '../../../general/drinkBox/vo_drinks.dart';

class TodaysConsumedDrinkList extends ChangeNotifier {
  List<Drink> _drinks = []; // 음료 목록을 저장하는 리스트

  List<Drink> get drinks => _drinks; // 외부에서 접근할 수 있도록 getter 허용

  // 음료 추가 함수
  void addDrink(Drink drink) {
    _drinks.add(drink);
    notifyListeners(); // 상태가 변경되었음을 알림
  }

  // 음료 삭제 함수
  void removeDrink(Drink drink) {
    _drinks.remove(drink);
    notifyListeners(); // 상태 변경 알림
  }
}
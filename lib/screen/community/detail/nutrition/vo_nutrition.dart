
// 영양성분표 제공을 위한 Nutrition 데이터 클래스
// 이후 Drink 클래스와 합칠 가능성 높음

class Nutrition {
  final int sodium;
  final int protein;
  final int saturatedFat;
  final int sugars;
  final int caffeine;
  final int calories;

  Nutrition(
      {required this.sodium,
      required this.protein,
      required this.saturatedFat,
      required this.sugars,
      required this.caffeine,
      required this.calories});
}

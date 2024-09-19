
// 레시피 포스팅에서 필요한 변수를 담은 레시피포스트 클래스

class RecipePost {
  final String userName;
  final String uploadedDate; // date 로 바꿔야함
  final String recipeTitle;
  final String recipeKeyword;
  final String recipeContent;
  final String userImage;
  final String recipeImage;
  final int likes;

  RecipePost({required this.userName, required this.uploadedDate, required this.recipeTitle,
      required this.recipeKeyword, required this.recipeContent, required this.userImage, required this.recipeImage, required this.likes});
}

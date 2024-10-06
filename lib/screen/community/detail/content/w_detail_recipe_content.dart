import 'package:blend_buddy/screen/community/detail/content/w_add_button.dart';
import 'package:blend_buddy/screen/community/detail/content/w_detail_recipe_likes.dart';
import 'package:blend_buddy/screen/community/detail/content/w_detail_recipe_text.dart';
import 'package:blend_buddy/screen/community/detail/recipe_post_dummy.dart';
import 'package:blend_buddy/screen/community/detail/vo_recipe_post.dart';
import 'package:flutter/material.dart';

// 레시피 포스팅에서의 중심 내용 컨테이너
// 사진과 글을 포함

class DetailRecipeContent extends StatelessWidget {
  final RecipePost recipePost;

  const DetailRecipeContent(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 35, right: 35),
      child: Container(
        width: 323,
        height: 510,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 323,
                  height: 323,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(recipePost.recipeImage),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 260, top: 10),
                  child: AddButton(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 63, left: 269),
                  child: DetailRecipeLikes(recipePost1),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: TitleText(recipePost1),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10),
                child: KeywordText(recipePost1)),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ContentText(recipePost1),
            ),
          ],
        ),
      ),
    );
  }
}

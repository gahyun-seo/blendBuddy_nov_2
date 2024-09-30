import 'package:blend_buddy/general/colorPalette.dart';
import 'package:blend_buddy/screen/community/detail/recipe_post_dummy.dart';
import 'package:flutter/material.dart';

import '../vo_recipe_post.dart';
import 'w_profile_image_button.dart';

// 레시피 포스팅에서의 헤더
// 유저 프로필 이미지, 이름, 게시글을 포함

class DetailRecipeHeader extends StatelessWidget {

  final RecipePost recipePost;

  const DetailRecipeHeader(this.recipePost, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34, right: 34),
      child: Container(
        width: 318,
        height: 59,
        child: Row(
          children: [
            ProfileImageButton(recipePost1),
            SizedBox(width: 15,),
            Container(
              width: 244,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${recipePost.userName}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: thirdColor,
                  ),),
                  Text('${recipePost.uploadedDate}', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: iconGrey,
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

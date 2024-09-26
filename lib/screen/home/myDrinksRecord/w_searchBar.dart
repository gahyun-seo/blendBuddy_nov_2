import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  const RecipeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10)
      ]),
      child: SearchBar(
        trailing: [
          Icon(Icons.search),
        ],
        backgroundColor: MaterialStatePropertyAll(Colors.white),
        shadowColor: MaterialStatePropertyAll(Colors.grey),
        overlayColor: MaterialStatePropertyAll(Colors.white),
        elevation: MaterialStatePropertyAll(0),
        hintText: '검색어를 입력하세요',
      ),
    );
  }
}

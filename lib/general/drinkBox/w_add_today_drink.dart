import 'dart:math';

import 'package:blend_buddy/general/w_theme.dart';
import 'package:flutter/material.dart';

class AddTodayDrinkPage extends StatefulWidget {
  const AddTodayDrinkPage({super.key});

  @override
  _AddTodayDrinkPageState createState() =>
      _AddTodayDrinkPageState();
}

class _AddTodayDrinkPageState extends State<AddTodayDrinkPage> {
  bool isExpanded = false; // 세부 설정이 열렸는지 상태를 관리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('당 줄인 돌체 콜드 브루 v1'),
      ),
      body: Stack(

        children: [
          Container(
            padding: EdgeInsets.all(20),
            color: mainColor, // pink 를 mainColor로 theme에 추가
            child: const Text("음료 사진 원래 화면 디자인 필요할 듯..."),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 1.0,
            snap: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(253, 249, 250, 1),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text('영양 정보', style: TextStyle(fontSize: 18, ), textAlign: TextAlign.left),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildNutritionInfo('카페인', '155mg'),
                                _buildNutritionInfo('포화지방', '9g'),
                                _buildNutritionInfo('당류', '29g'),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Text('총 열량 236 kcal',
                                style: TextStyle(
                                    fontSize: 16, color: mainColor)),
                          ],
                        ),
                      ),
                      ListTile(
                        title:
                        const Text('세부 설정', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: IconButton(
                          icon: Icon(isExpanded
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_right),
                          onPressed: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                        ),
                      ),
                      if (isExpanded) _buildCustomizationOptions(),
                    ],
                  ),
                ),
              );
            },
          ),

        ],
      ),
    );
  }

  Widget _buildNutritionInfo(String label, String value) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildCustomizationOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildOptionContainer('토핑 선택'),
          _buildOptionContainer('사이즈 선택'),
          _buildOptionContainer('커피 선택'),
          _buildOptionContainer('시럽 선택'),
          _buildOptionContainer('우유 선택'),
        ],
      ),
    );
  }

  // 각각의 세부 설정 선택 박스
  Widget _buildOptionContainer(String label) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      height: 247,
      width: 359,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          // 더미 옵션, 여기에 실제 옵션 추가 가능
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon:  Icon(Icons.remove_circle, color: mainColor), onPressed: () {}),
              const Text('0', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(icon: Icon(Icons.add_circle, color: mainColor), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:blend_buddy/general/drinkBox/vo_drinks.dart';
import 'package:blend_buddy/general/w_theme.dart'; // mainColor와 thirdColor를 사용하는 곳에서 필요한 임포트
import 'package:flutter/material.dart';

// 1001 가현 수정: 선택된 음료의 데이터가 나오게 변경

class AddTodayDrinkPage extends StatefulWidget {

  final Drink drink;

  AddTodayDrinkPage({super.key, required this.drink});

  @override
  _AddTodayDrinkPageState createState() => _AddTodayDrinkPageState();
}

class _AddTodayDrinkPageState extends State<AddTodayDrinkPage> {
  bool isExpanded = false; // 세부 설정이 열렸는지 상태를 관리

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.drink.drinkName}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 현재 페이지를 팝하여 이전 페이지로 돌아간다
          },
        ),
      ),
      body: Column(
        children: [
          // 메인 이미지와 스크롤 가능한 부분을 분리
          Expanded(
            child: Stack(
              children: [
                // 메인 이미지
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  //padding: EdgeInsets.all(20),
                  color: Colors.black,
                  alignment: Alignment.topCenter,
                  child: Image.asset(widget.drink.image), // 로컬 이미지 경로
                ),

                // 아래로 드래그 가능한 시트
                DraggableScrollableSheet(
                  initialChildSize: 0.6,
                  maxChildSize: 1.0,
                  snap: true,
                  builder: (BuildContext context, ScrollController scrollController) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                      ),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 영양 정보 섹션
                            Container(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '영양 정보',
                                    style: TextStyle(fontSize: 18),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 30),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildNutritionInfo('카페인', '${widget.drink.caffeine}'),
                                      _buildNutritionInfo('포화지방', '${widget.drink.saturatedFat}'),
                                      _buildNutritionInfo('당류', '${widget.drink.sugars}'),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    '총 열량 236 kcal',
                                    style: TextStyle(fontSize: 16, color: mainColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                '세부 설정',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
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
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // 등록하기 버튼 (핑크색으로 변경)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // 등록하기 버튼 동작
                // 등록하기 클릭 시 '오늘 마신 음료' 리스트에 추가되고 홈 화면에서 음료를 확인할 수 있다.
                Navigator.pop(context, widget.drink);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, // 버튼을 핑크색으로 설정
                minimumSize: Size(double.infinity, 50), // 버튼 크기 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('등록하기', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // 가운데 정렬
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCustomizationOptions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildOptionContainer('사이즈 선택'),
          _buildOptionContainer('토핑 선택'),
          _buildOptionContainer('커피 선택'),
          _buildOptionContainer('시럽 선택'),
          _buildOptionContainer('우유 선택'),
        ],
      ),
    );
  }

  // 각각의 세부 설정 선택 박스 (회색 상자 추가)
  Widget _buildOptionContainer(String label) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      height: 247, // 높이 조정
      width: 359, // 선택 박스 크기
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: mainColor, width: 2), // 테두리 색상과 굵기
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          // 회색 상자 추가 (세부 설정 안의 항목)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade200, // 회색 배경
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: mainColor),
                  onPressed: () {},
                ),
                const Text(
                  '0',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: mainColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

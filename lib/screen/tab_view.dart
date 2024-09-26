
import 'package:blend_buddy/general/w_theme.dart';
import 'package:blend_buddy/screen/community/main/s_community.dart';
import 'package:blend_buddy/screen/home/myDrinksRecord/f_drinks_record.dart';
import 'package:blend_buddy/screen/home/s_home.dart';
import 'package:blend_buddy/screen/recipes/s_recipes.dart';
import 'package:flutter/material.dart';

import 'settings/s_settings.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  int _index = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: _navItems.length, vsync: this);
    _tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    _tabController.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      _index = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: pink50,
        ),
        child: Container(
          height: 75,
          color: pink50,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Column(
              children: [
                BottomNavigationBar(
                  backgroundColor: pink50,
                  elevation: 0.0,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: mainColor,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 10,
                  ),
                  type: BottomNavigationBarType.fixed,
                  onTap: (int index) {
                    _tabController.animateTo(index);
                  },
                  currentIndex: _index,
                  items: _navItems.map((item) {
                    return BottomNavigationBarItem(
                      icon: Icon(_index == item.index ? item.activeIcon : item.inactiveIcon, size: 30),
                      label: item.label,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomePage(),
          CommunityPage(),
          DrinksRecordPage(),
        ],
      ),
    );
  }
}

class NavItem {
  final int index;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;

  const NavItem({
    required this.index,
    required this.activeIcon,
    required this.inactiveIcon,
    required this.label,
  });
}

const _navItems = {
  NavItem(
    index: 0,
    activeIcon: Icons.home,
    inactiveIcon: Icons.home_outlined,
    label: '홈',
  ),
  NavItem(
    index: 1,
    activeIcon: Icons.public,
    inactiveIcon: Icons.public_outlined,
    label: '커뮤니티',
  ),
  NavItem(
    index: 2,
    activeIcon: Icons.menu_book,
    inactiveIcon: Icons.menu_book_outlined,
    label: '내 레시피',
  ),
};
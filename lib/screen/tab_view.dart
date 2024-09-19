
import 'package:blend_buddy/general/drinkBox/w_theme.dart';
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
        ),
        child: SizedBox(
          height: 83,
          child: Column(
            children: [
              Divider(color: secondColor,),
              BottomNavigationBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                selectedItemColor: mainColor,
                unselectedItemColor: iconGrey,
                selectedLabelStyle: const TextStyle(
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
                    icon: Icon(_index == item.index ? item.activeIcon : item.inactiveIcon, size: 35),
                    label: item.label,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          HomePage(),
          CommunityPage(),
          RecipesPage(),
          SettingsPage()
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
    activeIcon: Icons.home_rounded,
    inactiveIcon: Icons.home_rounded,
    label: '홈',
  ),
  NavItem(
    index: 1,
    activeIcon: Icons.group,
    inactiveIcon: Icons.group,
    label: '커뮤니티',
  ),
  NavItem(
    index: 2,
    activeIcon: Icons.coffee,
    inactiveIcon: Icons.coffee,
    label: '내 레시피',
  ),
  NavItem(
    index: 3,
    activeIcon: Icons.settings,
    inactiveIcon: Icons.settings,
    label: '설정',
  ),
};
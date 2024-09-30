
import 'package:blend_buddy/general/colorPalette.dart';
import 'package:blend_buddy/screen/community/main/s_community.dart';
import 'package:blend_buddy/screen/home/myDrinksRecord/f_drinks_record.dart';
import 'package:blend_buddy/screen/home/s_home.dart';
import 'package:flutter/material.dart';


class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => TabViewState();
}

class TabViewState extends State<TabView> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: _navItems.length, vsync: this);
    tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    tabController.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = tabController.index;
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
        child: Container(
          height: 98,
          //color: tabColor,
          alignment: Alignment.center,

          child: Column(
            children: [
                BottomNavigationBar(

                  backgroundColor: tabColor,
                  selectedItemColor: mainColor,
                  unselectedItemColor: mainColor,
                  selectedIconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: mainColor,
                  ),
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.4,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12.4,
                  ),
                  type: BottomNavigationBarType.fixed,
                  onTap: (int index) {
                    tabController.animateTo(index);
                  },
                  currentIndex: index,
                  items: _navItems.map((item) {
                    return BottomNavigationBarItem(
                      icon: Container(
                        width: 61.05,
                        height: 30.52,
                        decoration: BoxDecoration(
                          color: index == item.index ? pink300 : Colors.transparent,
                          borderRadius: BorderRadius.circular(15.26),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              index == item.index ? item.activeIcon : item.inactiveIcon,
                              size: 22.89,
                            ),
                            //SizedBox(height: 8),
                            //Text(item.label, style: TextStyle(fontSize: 12.4)),
                          ],
                        ),
                        //Icon(_index == item.index ? item.activeIcon : item.inactiveIcon, size: 30),
                      ),
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
        controller: tabController,
        children: const [
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

const List<NavItem> _navItems = [
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
];
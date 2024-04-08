import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab.dart';
import 'package:movies_app/presentation/home/tabs/home_tab.dart';
import 'package:movies_app/presentation/home/tabs/search_tab.dart';
import 'package:movies_app/presentation/home/tabs/watchlist_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(),SearchTab(),BrowseTab(),WatchListTab()];
  List<IconData> iconsList = [Icons.home, Icons.search, Icons.movie, Icons.collections_bookmark];
  List<String> tabsLabel = ["HOME","SEARCH","BROWSE","WATCHLIST"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 70.h,
        itemCount: iconsList.length,
        tabBuilder: (int index,bool isActive){
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconsList[index],
                size: 28.sp,
                color: isActive? ColorsManager.selectedTabColor: ColorsManager.unSelectedTabColor,
              ),
              SizedBox(height: 4.h),
              Text(
                tabsLabel[index],
                style: TextStyle(fontSize: 12.sp,color: isActive? ColorsManager.selectedTabColor: ColorsManager.unSelectedTabColor),
              )
            ],
          );
        },
        gapLocation: GapLocation.none,
        backgroundColor: ColorsManager.bottomNavBackgroundColor,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        activeIndex: selectedIndex,
      ),
      body: tabs[selectedIndex],
    );
  }
}

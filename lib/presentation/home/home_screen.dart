import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/browse_tab.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:movies_app/presentation/home/tabs/search_tab/search_tab.dart';
import 'package:movies_app/presentation/home/tabs/search_tab/search_viewModel.dart';
import 'package:movies_app/presentation/home/tabs/watchlist_tab/watchlist_tab.dart';
import 'package:provider/provider.dart';

import '../../core/firebase/providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    BlocProvider(
        create: (context) => getIt<SearchViewModel>(), child: SearchTab()),
    BrowseTab(),
    WatchListTab(),
  ];
  List<IconData> iconsList = [
    Icons.home,
    Icons.search,
    Icons.movie,
    Icons.collections_bookmark,
  ];
  List<String> tabsLabel = [
    "Home",
    "Search",
    "Browse",
    "WatchList",
  ];

  @override
  Widget build(BuildContext context) {
    AuthProviders authProviders = Provider.of<AuthProviders>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(tabsLabel[selectedIndex],style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          IconButton(
            onPressed: () {
              authProviders.signOut();
              Navigator.pushReplacementNamed(
                  context, RoutesManager.loginRouteName);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 70.h,
        itemCount: iconsList.length,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconsList[index],
                size: 28.sp,
                color: isActive
                    ? ColorsManager.selectedTabColor
                    : ColorsManager.unSelectedTabColor,
              ),
              SizedBox(height: 4.h),
              Text(tabsLabel[index],
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isActive
                          ? ColorsManager.selectedTabColor
                          : ColorsManager.unSelectedTabColor,
                  ))
            ],
          );
        },
        gapLocation: GapLocation.none,
        backgroundColor: ColorsManager.bottomNavBackgroundColor,
        onTap: (index) {
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

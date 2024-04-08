import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412,892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          title: 'Movies Application',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: RoutesManager.homeScreenRoute,
          routes: {
            RoutesManager.homeScreenRoute:(_)=>HomeScreen(),
          },
        );
      },
    );
  }
}

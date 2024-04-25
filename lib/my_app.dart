import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/theme/app_theme.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/auth/login/login_screen.dart';
import 'package:movies_app/presentation/auth/register/register_screen.dart';
import 'package:movies_app/presentation/home/details/movie_details/widgets/movie_details_widget.dart';
import 'package:movies_app/presentation/home/home_screen.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/specific_genre_list_widget.dart';

import 'presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Movies Application',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: RoutesManager.splashScreenRoute,
          routes: {
            RoutesManager.homeScreenRoute: (_) => const HomeScreen(),
            RoutesManager.splashScreenRoute: (_) => const SplashScreen(),
            RoutesManager.specificGenreListScreen: (_) =>
                const SpecificGenreListWidget(),
            RoutesManager.registerRouteName: (_) => RegisterScreen(),
            RoutesManager.loginRouteName: (_) => LoginScreen(),
          },
        );
      },
    );
  }
}

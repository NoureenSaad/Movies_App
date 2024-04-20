import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/core/utils/strings_manager.dart';
import 'package:provider/provider.dart';

import '../../core/firebase/providers/auth_provider.dart';
import '../../core/utils/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () =>  checkAutoLogin(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.bottomNavBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              height: 300.h,
              AssetsManager.appLogo,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              StringsManager.appName,
              style: GoogleFonts.playfairDisplay(
                textStyle: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
  checkAutoLogin() async {
    AuthProviders authProviders =
    Provider.of<AuthProviders>(context, listen: false);
    if (authProviders.isFirebaseUserLoggedIn()) {
      await authProviders.retrieveDatabaseUserData();
      Navigator.pushReplacementNamed(context,  RoutesManager.homeScreenRoute);
    } else {
      Navigator.pushReplacementNamed(context, RoutesManager.loginRouteName);
    }
  }
}

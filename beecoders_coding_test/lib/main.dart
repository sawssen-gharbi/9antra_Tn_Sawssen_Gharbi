import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beecoders_coding_test/screens/landing_page.dart';

import 'package:beecoders_coding_test/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

void main() {
  /* WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values); */ //show status bar

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Style.pink,
  )); // hide status bar
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26),
            scaffoldBackgroundColor: Style.lightBeige,
            useMaterial3: true,
          ),
          home: AnimatedSplashScreen(
              splash: Center(child: Image.asset("Assets/logo.png")),
              duration: 3000,
              splashIconSize: 50,
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: Style.lightBeige,
              nextScreen: const LandingPage()),
        ));
  }
}

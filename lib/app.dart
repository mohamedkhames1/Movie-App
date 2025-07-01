import 'package:flutter/material.dart';
import 'package:move_app/app/router.dart';
import 'package:move_app/core/utils/colors.dart';
import 'package:move_app/presentation/screens/auth/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.background,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.navigationMenu,
      // home: const SignUpView(),
      home: const LoginView(),
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

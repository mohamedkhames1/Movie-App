import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/core/utils/colors.dart';
import 'package:move_app/logic/cubits/navigation_cubit/navigation_menu_cubit.dart';
import 'package:move_app/navigation_menu.dart';
import 'package:move_app/presentation/screens/auth/Login.dart';
import 'package:move_app/presentation/screens/auth/register.dart';

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
      home: BlocProvider(
        create: (context) => NavigationMenuCubit(),
        child: const NavigationMenu(),
      ),
    );
  }
}

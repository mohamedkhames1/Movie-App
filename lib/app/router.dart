import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubits/navigation_cubit/navigation_menu_cubit.dart';
import '../navigation_menu.dart';
import '../presentation/screens/detail/details_screen.dart';
import '../presentation/screens/home/home_screen.dart';

abstract class AppRouter {
  static const String home = '/home';
  static const String navigationMenu = '/navigationMenu';
  static const String details = '/details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case details:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
      case navigationMenu:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => NavigationMenuCubit(),
            child: const NavigationMenu(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

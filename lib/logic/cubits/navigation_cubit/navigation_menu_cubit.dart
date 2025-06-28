import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/presentation/screens/home/home_screen.dart';

import '../../../presentation/screens/detail/details_screen.dart';

part 'navigation_menu_state.dart';

class NavigationMenuCubit extends Cubit<NavigationMenuState> {
  NavigationMenuCubit() : super(NavigationMenuInitial());

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final List<Widget> _pages = const [
    HomeScreen(),
    // Center(
    //   child: Text('Search Screen', style: TextStyle(color: Colors.white)),
    // ),
    DetailsScreen(),
    Center(
      child: Text('Wish List Screen', style: TextStyle(color: Colors.white)),
    ),
  ];

  Widget get currentPage => _pages[_currentIndex];

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    emit(NavigationMenuChanged(index));
  }
}

part of 'navigation_menu_cubit.dart';

abstract class NavigationMenuState {}

class NavigationMenuInitial extends NavigationMenuState {}

class NavigationMenuChanged extends NavigationMenuState {
  final int currentIndex;

  NavigationMenuChanged(this.currentIndex);
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/logic/cubits/navigation_cubit/navigation_menu_cubit.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationMenuCubit, NavigationMenuState>(
        builder: (context, state) {
          return context.read<NavigationMenuCubit>().currentPage;
        },
      ),
      bottomNavigationBar:
          BlocBuilder<NavigationMenuCubit, NavigationMenuState>(
            builder: (context, state) {
              final cubit = context.read<NavigationMenuCubit>();
              return BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: cubit.changeIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Wish List',
                  ),
                ],
              );
            },
          ),
    );
  }
}

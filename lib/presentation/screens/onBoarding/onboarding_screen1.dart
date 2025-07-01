import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/logic/cubits/onBoardingCubits/onboarding_cubit.dart';

import 'onboarding_content.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state.currentPage;
    return SafeArea(
      child: OnboardingContent(
        imagePath: 'assets/images/onBoarding1.png',
        title: 'Welcome to the App',
        description: 'Discover new ways to learn and grow using our engaging platform.',
        currentPage: currentPage,
        totalPages: 3,
      ),
    );
  }
}

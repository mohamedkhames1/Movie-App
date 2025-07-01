import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/logic/cubits/onBoardingCubits/onboarding_cubit.dart';
import 'onboarding_content.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});
  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state.currentPage;
    return SafeArea(
      child: OnboardingContent(
        imagePath: 'assets/images/onBoarding3.png',
        title: 'Start Your Journey',
        description: 'Sign up and take your skills to the next level today!',
        currentPage: currentPage,
        totalPages: 3,
      ),
    );
  }
}

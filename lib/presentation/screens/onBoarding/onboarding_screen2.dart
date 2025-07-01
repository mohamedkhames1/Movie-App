import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/logic/cubits/onBoardingCubits/onboarding_cubit.dart';
import 'onboarding_content.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state.currentPage;
    return SafeArea(
      child: OnboardingContent(
        imagePath: 'assets/images/onBoarding2.png',
        title: 'Interactive Learning',
        description: 'Semper in cursus magna et eu varius nunc adipiscing.',
        currentPage: currentPage,
        totalPages: 3,
      ),
    );
  }
}

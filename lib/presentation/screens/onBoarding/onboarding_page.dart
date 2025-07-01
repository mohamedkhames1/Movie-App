import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_app/logic/cubits/onBoardingCubits/onboarding_cubit.dart';
import 'package:move_app/logic/cubits/onBoardingCubits/onboarding_state.dart';
import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';
import 'onboarding_screen3.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  final List<Widget> _screens = const [
    OnboardingScreen1(),
    OnboardingScreen2(),
    OnboardingScreen3(),
  ];

  void _onNext() {
    final cubit = context.read<OnboardingCubit>();
    final nextPage = cubit.state.currentPage + 1;

    if (nextPage < _screens.length) {
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Replace with actual navigation after onboarding
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Onboarding Complete')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12142A),
      body: Column(
        children: [
          // PageView content
          Expanded(
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                return PageView(
                  controller: _controller,
                  onPageChanged: (index) =>
                      context.read<OnboardingCubit>().setPage(index),
                  children: _screens,
                );
              },
            ),
          ),

          // Buttons section
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 24, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                TextButton(
                  onPressed: () {
                    _controller.jumpToPage(_screens.length - 1);
                    context
                        .read<OnboardingCubit>()
                        .setPage(_screens.length - 1);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Color(0xFF9E9EAD)),
                  ),
                ),

                // Next or Start button
                BlocBuilder<OnboardingCubit, OnboardingState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: _onNext,
                      child: Text(
                        state.currentPage == _screens.length - 1
                            ? 'Start'
                            : 'Next',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

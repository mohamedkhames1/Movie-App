import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const DotIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF00D2FF) : const Color(0xFF2A2D50),
            borderRadius: BorderRadius.circular(8),
          ),
        );
      }),
    );
  }
}

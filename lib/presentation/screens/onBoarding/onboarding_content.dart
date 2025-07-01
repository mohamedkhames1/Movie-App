import 'package:flutter/material.dart';
import 'dot_indicator.dart';

class OnboardingContent extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final int currentPage;
  final int totalPages;

  const OnboardingContent({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Image
              Image.asset(
                imagePath,
                width: MediaQuery.of(context).size.width * 0.50,
                fit: BoxFit.contain,
              ),
              // Title
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
                
              ),
              // Description
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              // Dot Indicators
              DotIndicator(currentPage: currentPage, totalPages: totalPages),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.2,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the citys hidden corruption and question his family\'s involvement.',
          style: TextStyle(color: Colors.grey, height: 2, letterSpacing: 1.2),
        ),
      ],
    );
  }
}

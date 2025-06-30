import 'package:flutter/material.dart';

class MovieInfoSection extends StatelessWidget {
  const MovieInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Spiderman: No Way Home',
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 25),
                  SizedBox(width: 4),
                  Text('8.5/10 IMDb', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

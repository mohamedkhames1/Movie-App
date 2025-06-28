import 'package:flutter/material.dart';
import 'package:move_app/core/utils/assets.dart';

class NowShowItem extends StatelessWidget {
  const NowShowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              Assets.assetsImagesTestImage,
              width: 180,
              height: 260,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Spiderman: No Way Home',
            style: TextStyle(
              letterSpacing: 1.2,
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text('9.1/10 IMDb', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}

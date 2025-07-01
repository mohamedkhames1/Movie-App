import 'package:flutter/material.dart';
import 'now_show_item.dart';

class NowShowingSlider extends StatelessWidget {
  const NowShowingSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/details'),
        child: SizedBox(
          height: 350,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            itemCount: 8,
            itemBuilder: (context, index) => const NowShowItem(),
          ),
        ),
      ),
    );
  }
}

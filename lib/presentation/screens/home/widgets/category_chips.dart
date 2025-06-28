import 'package:flutter/material.dart';

import 'category_chip.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['HORROR', 'MYSTERY', 'THRILLER'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((label) => CategoryChip(label: label)).toList(),
    );
  }
}

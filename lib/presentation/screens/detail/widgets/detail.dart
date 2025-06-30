import 'package:flutter/material.dart';
import 'package:move_app/core/utils/colors.dart';
import 'package:move_app/presentation/screens/detail/widgets/description.dart';
import 'package:move_app/presentation/screens/home/widgets/category_chips.dart';

import '../../home/widgets/section_header.dart';
import 'cast_section.dart';
import 'movie_info_section.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(color: AppColors.background),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MovieInfoSection(),
            SizedBox(height: 16),
            const CategoryChips(),
            const SizedBox(height: 16),
            const Description(),
            const SizedBox(height: 30),
            SectionHeader(title: 'Cast '),
            const SizedBox(height: 30),
            const CastSection(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'popular_list_item.dart';

class PopularList extends StatelessWidget {
  const PopularList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const PopularListItem(),
        childCount: 6,
      ),
    );
  }
}

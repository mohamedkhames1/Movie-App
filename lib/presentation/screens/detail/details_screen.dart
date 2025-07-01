import 'package:flutter/material.dart';
import 'widgets/detail.dart';
import 'widgets/trailer_section.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [const TrailerSection(), const Details()],
      ),
    );
  }
}

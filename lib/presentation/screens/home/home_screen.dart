import 'package:flutter/material.dart';
import 'package:move_app/presentation/screens/home/widgets/popular_list.dart';
import 'widgets/now_showing_slider.dart';
import 'widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Movies',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SectionHeader(title: 'Now Showing'),
          const NowShowingSlider(),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SectionHeader(title: 'Popular'),
          PopularList(),
        ],
      ),
    );
  }
}

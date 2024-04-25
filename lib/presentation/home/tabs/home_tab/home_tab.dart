import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/presentation/home/tabs/home_tab/popular_movies/widgets/popular_movies_slider_widget.dart';

import 'package:movies_app/presentation/home/tabs/home_tab/recommended_movies/widgets/recommended_list_widget.dart';

import 'new_releases_movies/widgets/new_releases_list_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: PopularMoviesSliderWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: NewReleasesListWidget(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 24.h,
              ),
            ),
            const SliverToBoxAdapter(
              child: RecommendListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

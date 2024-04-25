import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/home/tabs/home_tab/popular_movies/widgets/popular_movie_widget.dart';

import '../../../../../../core/DI/di.dart';
import '../../../../details/movie_details/widgets/movie_details_widget.dart';
import '../view_model/popular_movies_view_model.dart';

class PopularMoviesSliderWidget extends StatelessWidget {
  const PopularMoviesSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PopularMoviesViewModel>()..getPopularMovie(),
      child: BlocBuilder<PopularMoviesViewModel, PopularMoviesStates>(
          builder: (context, state) {
        if (state is PopularMoviesSuccessState) {
          return CarouselSlider.builder(
            options: CarouselOptions(
                height: 289.h,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
            itemCount: state.popularMovies.length,
            itemBuilder: (context, index, index2) {
              return PopularMovieWidget(
                moviesEntity: state.popularMovies[index],
              );
            },
          );
        } else if (state is PopularMoviesErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}

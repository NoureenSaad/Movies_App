import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/movie_card_widget.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/domain/usecases/movies_details_usecase.dart';
import 'package:movies_app/presentation/home/details/movie_details/widgets/similar_movies-widget.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/constants.dart';
import '../../../../../data/datasource_impl/movies_details_datasource_impl.dart';
import '../../../../../data/repository_impl/movies_detais_repo_impl.dart';
import '../view_model/movie_details_viewmodel.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  final bool? adult;

  MoviesEntity moviesEntity;

  MovieDetailsScreen({
    super.key,
    required this.movieId,
    this.adult,
    required this.moviesEntity, // Making adult parameter optional
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details',style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: BlocProvider(
            create: (context) => MovieDetailsViewModel(
              MovieDetailsUseCase(
                MoviesDetailsRepoImpl(
                  MovieDetailsDataSourceImpl(ApiManager()),
                ),
              ),
            ),
            child: BlocBuilder<MovieDetailsViewModel, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsInitial) {
                  BlocProvider.of<MovieDetailsViewModel>(context)
                      .fetchMovieDetails(movieId);
                }
                if (state is MovieDetailsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is MovieDetailsLoaded) {
                  final details = state.details;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (details.backdropPath != null)
                          Image.network(
                            '${Constants.imagePathBaseUrl}${details.backdropPath}',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(details.title ?? '',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    _extractYearFromDate(details.releaseDate),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    getGPRating(adult ?? false),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    formatRuntime(details.runtime),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (details.posterPath != null)
                                    MovieCardWidget(moviesEntity: moviesEntity)
                                  ,
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: details.genres?.map((e) {
                                                  return Container(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8,
                                                        vertical: 6),
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                      border: Border.all(
                                                          color: Colors.white,
                                                          width: 1),
                                                    ),
                                                    child: Text(
                                                      e.name ?? '',
                                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                        fontSize: 16.sp
                                                      ),
                                                    ),
                                                  );
                                                }).toList() ??
                                                [],
                                          ),
                                          const SizedBox(height: 13),
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Colors.black,
                                                    title: Text(
                                                      'Overview',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall
                                                          ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                    ),
                                                    content: Text(
                                                      details.overview ?? '',
                                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                          fontSize: 16.sp
                                                      ),
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text(
                                                          'Close',
                                                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                                            fontSize: 16.sp,
                                                            color: Colors.red
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text(
                                              details.overview ?? '',
                                              maxLines: 4,
                                              overflow: TextOverflow.ellipsis,
                                              style:  Theme.of(context).textTheme.titleLarge?.copyWith(
                                                  fontSize: 16.sp
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 25,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                details.voteAverage != null
                                                    ? details.voteAverage!
                                                        .toStringAsFixed(1)
                                                    : "",
                                                style:  Theme.of(context).textTheme.titleLarge,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is MovieDetailsError) {
                  return Center(
                    child: Text('Error: ${state.message}',
                        style: const TextStyle(color: Colors.white)),
                  );
                }
                return Container(); // Return empty container as default
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 8,
        )),
        SliverToBoxAdapter(
            child: SimilarListMovie(
          moviesEntity: moviesEntity,
        ))
      ]),
    );
  }

  String formatRuntime(int? runtimeInMinutes) {
    if (runtimeInMinutes != null && runtimeInMinutes > 0) {
      int hours = runtimeInMinutes ~/ 60;
      int minutes = runtimeInMinutes % 60;

      if (hours > 0 && minutes > 0) {
        return '${hours}h ${minutes}min';
      } else if (hours > 0) {
        return '${hours}h';
      } else if (minutes > 0) {
        return '${minutes}min';
      } else {
        return 'Unknown';
      }
    } else {
      return 'Unknown';
    }
  }

  String _extractYearFromDate(String? releaseDate) {
    if (releaseDate != null) {
      DateTime dateTime = DateTime.tryParse(releaseDate)!;
      int year = dateTime.year;
      return '$year';
    } else {
      return 'Unknown';
    }
  }

  String getGPRating(bool adult) {
    if (adult) {
      return 'NC-17';
    } else {
      return 'PG-13';
    }
  }
}

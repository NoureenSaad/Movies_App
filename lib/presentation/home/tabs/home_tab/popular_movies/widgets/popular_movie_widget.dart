import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/movie_card_widget.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/reusable_functions/reusable_functions.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../details/movie_details/widgets/movie_details_widget.dart';

class PopularMovieWidget extends StatelessWidget {
  final MoviesEntity moviesEntity;

  const PopularMovieWidget({super.key, required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    String movieYear =
        ReusableFunctions.extractYear(moviesEntity.releaseDate ?? "");
    String movieClassification =
        ReusableFunctions.getMovieClassification(moviesEntity.adult ?? false);
    return InkWell(
      onTap: () {
        // Navigate to movie details screen if movieId is not null لا سمح الله يعني
        if (moviesEntity.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: moviesEntity.id!,
                moviesEntity: moviesEntity,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie ID is null'),
            ),
          );
        }
      },
      child: Container(
        height: 289.h,
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                '${Constants.imagePathBaseUrl}${moviesEntity.backdropPath}',
                fit: BoxFit.cover,
                height: 217.h,
                width: 412.w,
              ),
            ),
            Positioned(
              top: 90.h,
              left: 21.h,
              child: Row(
                children: [
                  MovieCardWidget(moviesEntity: moviesEntity),
                  SizedBox(
                    width: 14.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 130,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${moviesEntity.title} ',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Text(
                          '$movieYear  $movieClassification  2h 7m',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: ColorsManager.movieDetailsTextColor,
                                fontSize: 10.sp,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

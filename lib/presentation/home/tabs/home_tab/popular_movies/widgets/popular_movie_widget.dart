import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/reusable_components/movie_card_widget.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

import '../../../../../../core/constants.dart';
import '../../../../../../core/reusable_functions/reusable_functions.dart';
import '../../../../../../core/utils/colors_manager.dart';

class PopularMovieWidget extends StatelessWidget {
  MoviesEntity moviesEntity;

  PopularMovieWidget({super.key, required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    String movieYear =
        ReusableFunctions.extractYear(moviesEntity.releaseDate ?? "");
    String movieClassification =
        ReusableFunctions.getMovieClassification(moviesEntity.adult ?? false);
    return InkWell(
      onTap: () {
        //todo: navigate to movie details
      },
      child: Container(
        height: 289.h,
        color: Theme.of(context).colorScheme.primary,
        child: Stack(
          children: [
            Image.network(
              '${Constants.imagePathBaseUrl}${moviesEntity.backdropPath}',
              fit: BoxFit.cover,
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
                      top: 110,
                      left: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${moviesEntity.title} ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            textStyle:
                                Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Text(
                          //Todo: waiting movie time from Haneen
                          '$movieYear  $movieClassification  2h 7m',
                          style: GoogleFonts.inter(
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: ColorsManager.movieDetailsTextColor,
                                  fontSize: 10.sp,
                                ),
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/reusable_components/movie_card_widget.dart';
import 'package:movies_app/core/reusable_functions/reusable_functions.dart';
import '../../domain/entities/MoviesEntity.dart';
import '../../presentation/home/details/movie_details/widgets/movie_details_widget.dart';
import '../utils/colors_manager.dart';

class LongMovieCardWidget extends StatelessWidget {
  MoviesEntity movie;

  LongMovieCardWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (movie.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: movie.id!,
                moviesEntity: movie,
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
      child: SizedBox(
        height: 180.h,
        width: 300.w,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    height: 170,
                    width: 120,
                    child: MovieCardWidget(moviesEntity: movie)),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${movie.title}",
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        ReusableFunctions.extractYear(
                            movie.releaseDate.toString()),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: ColorsManager.selectedTabColor,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "${movie.voteAverage?.toStringAsFixed(1)}",
                            style: Theme.of(context).textTheme.headlineSmall
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        '${ReusableFunctions.extractYear(movie.releaseDate ?? "")}  ${ReusableFunctions.getMovieClassification(movie.adult ?? false)} ',
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
          ],
        ),
      ),
    );
  }
}

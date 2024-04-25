import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/presentation/home/details/movie_details/view_model/similar_movie_viewmodel.dart';
import '../../../../../../core/DI/di.dart';
import '../../../../../../core/reusable_components/movie_card_widget.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../../../../../core/reusable_functions/reusable_functions.dart';

class SimilarListMovie extends StatelessWidget {
   SimilarListMovie({super.key, required this.moviesEntity});
MoviesEntity moviesEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      color: ColorsManager.containerColor,
      child: Padding(
        padding: REdgeInsets.only(left: 18.0,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.moreLikeThis,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocProvider(
              create: (context) =>
              getIt<SimilarMoviesViewModel>()..fetchSimilarMovies(moviesEntity.id as int ),
              child: BlocBuilder<SimilarMoviesViewModel,
                  SimilarMoviesState>(builder: (context, state) {
                if (state is SimilarMoviesSucess) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 14.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.similarMovies.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 100.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.h,
                                child: InkWell(
                                  onTap: () {
                                    //Todo: navigate to movie details
                                  },
                                  child: MovieCardWidget(
                                    moviesEntity:
                                    state.similarMovies[index],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 20,
                                    color: ColorsManager.selectedTabColor,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    state.similarMovies[index].voteAverage!
                                        .toStringAsFixed(1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                      color: Colors.white,
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                state.similarMovies[index].title.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                  color: Colors.white,
                                  fontSize: 10.sp,
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                '${ReusableFunctions.extractYear(state.similarMovies[index].releaseDate ?? "")}  ${ReusableFunctions.getMovieClassification(state.similarMovies[index].adult ?? false)} ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                  color:
                                  ColorsManager.movieDetailsTextColor,
                                  fontSize: 10.sp,
                                ),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is SimilarMoviesError) {
                  return Center(
                    child: Text(
                      state.message,
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
            ),
          ],
        ),
      ),
    );
  }
}

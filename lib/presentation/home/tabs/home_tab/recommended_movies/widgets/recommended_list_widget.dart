import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../core/DI/di.dart';
import '../../../../../../core/reusable_components/movie_card_widget.dart';
import '../../../../../../core/reusable_functions/reusable_functions.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../view_model/recommended_movies_view_model.dart';

class RecommendListWidget extends StatelessWidget {
  const RecommendListWidget({super.key});

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
              StringsManager.recommended,
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
                  getIt<RecommendedMoviesViewModel>()..getRecommendedMovie(),
              child: BlocBuilder<RecommendedMoviesViewModel,
                  RecommendedMoviesStates>(builder: (context, state) {
                if (state is RecommendedMoviesSuccessState) {
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 14.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recommendedMovies.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 100.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150.h,
                                child: MovieCardWidget(
                                  moviesEntity:
                                      state.recommendedMovies[index],
                                ),
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
                                    state.recommendedMovies[index].voteAverage!
                                        .toStringAsFixed(1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                state.recommendedMovies[index].title.toString(),
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
                                '${ReusableFunctions.extractYear(state.recommendedMovies[index].releaseDate ?? "")}  ${ReusableFunctions.getMovieClassification(state.recommendedMovies[index].adult ?? false)} ',
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
                } else if (state is RecommendedMoviesErrorState) {
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
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      height: 300.h,
      color: ColorsManager.containerColor,
      child: Padding(
        padding: REdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.recommended,
              style: GoogleFonts.inter(
                textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 24.sp,
                    ),
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
                        width: 10.w,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.recommendedMovies.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150.h,
                              child: InkWell(
                                onTap: (){
                                  //Todo: navigate to movie details
                                },
                                child: MovieCardWidget(
                                  moviesEntity:
                                      state.recommendedMovies[index],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: ColorsManager.selectedTabColor,
                                ),
                                SizedBox(width: 5.w,),
                                Text(
                                  //todo: null check
                                  state.recommendedMovies[index].voteAverage
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              state.recommendedMovies[index].title
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.white,
                                      //todo: card check
                                      fontSize: 10.sp,
                                    ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              //Todo: waiting movie time from Haneen
                              '${ReusableFunctions.extractYear(state.recommendedMovies[index].releaseDate ?? "")}  ${ReusableFunctions.getMovieClassification(state.recommendedMovies[index].adult ?? false)} 2h 7m',
                              style: GoogleFonts.inter(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: ColorsManager
                                          .movieDetailsTextColor,
                                      fontSize: 10.sp,
                                    ),
                              ),
                            ),
                          ],
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

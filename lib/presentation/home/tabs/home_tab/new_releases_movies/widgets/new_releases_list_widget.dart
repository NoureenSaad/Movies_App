import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/reusable_components/long_movie_card_widget.dart';

import '../../../../../../core/DI/di.dart';
import '../../../../../../core/reusable_components/movie_card_widget.dart';
import '../../../../../../core/utils/colors_manager.dart';
import '../../../../../../core/utils/strings_manager.dart';
import '../view_model/new_release_view_model.dart';

class NewReleasesListWidget extends StatelessWidget {
  const NewReleasesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      color: ColorsManager.containerColor,
      child: Padding(
        padding:  REdgeInsets.only(left: 18.0,top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.newReleases,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(
                color: Colors.white,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocProvider(
              create: (context) =>
              getIt<NewReleasesMoviesViewModel>()..getNewReleaseMovie(),
              child: BlocBuilder<NewReleasesMoviesViewModel, NewReleasesMoviesStates>(
                  builder: (context, state) {
                    if (state is NewReleaseMoviesSuccessState) {
                      return Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 14.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: state.newReleaseMovies.length,
                          itemBuilder: (context, index) {
                            return 
                              MovieCardWidget(
                              moviesEntity: state.newReleaseMovies[index],
                            );
                          },
                        ),
                      );
                    } else if (state is NewReleaseMoviesErrorState) {
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

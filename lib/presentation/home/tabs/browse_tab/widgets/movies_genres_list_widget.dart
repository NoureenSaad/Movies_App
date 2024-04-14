import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'movie_genre_wigdet.dart';

class MoviesGenresListWidget extends StatelessWidget {
  const MoviesGenresListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: SizedBox(
          height: 800.h,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.w
              ),
              itemCount: 10,
              itemBuilder: (context, index){
                return MovieGenreWidget(genreName: "action");
              }
          ),
        ),
      ),
    );
  }
}

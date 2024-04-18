import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';

import '../utils/colors_manager.dart';

class MovieCardWidget extends StatelessWidget {
  MoviesEntity moviesEntity;

  MovieCardWidget({super.key, required this.moviesEntity});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          height: 199.h,
          '${Constants.imagePathBaseUrl}${moviesEntity.posterPath}',
        ),
        Positioned(
          top: -5.h,
          left: -8.h,
          child: Stack(
            children: [
              Icon(
                Icons.bookmark,
                color: ColorsManager.bookmarkIconColor,
                size: 50.sp,
              ),
              IconButton(
                onPressed: () {
                  //Todo: add to wishlist
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

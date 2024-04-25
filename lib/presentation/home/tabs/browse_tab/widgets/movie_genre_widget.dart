import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/MoviesGenreEntity.dart';

class MovieGenreWidget extends StatelessWidget {
  MoviesGenreEntity movieGenre;
  String imagePath;
  MovieGenreWidget({super.key,required this.movieGenre,required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15).r,
        image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
      ),
      child: Text(movieGenre.name??"",style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieGenreWidget extends StatelessWidget {
  String genreName;
  MovieGenreWidget({super.key,required this.genreName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(image: AssetImage("assets/images/action.png"),fit: BoxFit.fill,),
        Text(genreName),
      ],
    );
  }
}

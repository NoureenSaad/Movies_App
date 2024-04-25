import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import '../../presentation/home/details/movie_details/widgets/movie_details_widget.dart';

class MovieCardWidget extends StatefulWidget {
 final  MoviesEntity moviesEntity;
  late bool isMovieFavorite;

  MovieCardWidget({super.key, required this.moviesEntity});

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.moviesEntity.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: widget.moviesEntity.id!,
                moviesEntity: widget.moviesEntity,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.r),
        child: Stack(
          children: [
            widget.moviesEntity.posterPath != null
                ? Image.network(
                    height: 199.h,
                    "${Constants.imagePathBaseUrl}${widget.moviesEntity.posterPath}",
                  )
                : Center(
                    child: Icon(
                    Icons.movie,
                    color: Colors.white,
                    size: 50.sp,
                  )),
            Positioned(
              top: -6.h,
              left: -34.h,
              child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () {
                    if (widget.isMovieFavorite) {
                      setState(() {
                        FireStoreHelper.deleteMovie(
                            FirebaseAuth.instance.currentUser!.uid,
                            widget.moviesEntity.id.toString());
                      });
                    } else {
                      setState(() {
                        FireStoreHelper.addToWatchList(
                            FirebaseAuth.instance.currentUser!.uid,
                            MoviesEntity(
                                id: widget.moviesEntity.id,
                                voteAverage: widget.moviesEntity.voteAverage,
                                posterPath: widget.moviesEntity.posterPath,
                                isFavorite: true,
                                releaseDate: widget.moviesEntity.releaseDate,
                                title: widget.moviesEntity.title));
                      });
                    }
                  },
                  child: StreamBuilder(
                      stream: FireStoreHelper.isFavoriteCheck(
                          userID: FirebaseAuth.instance.currentUser!.uid,
                          id: widget.moviesEntity.id.toString()),
                      builder: (context, snapshot) {
                        MoviesEntity movie = snapshot.data ?? MoviesEntity();
                        widget.isMovieFavorite = movie.isFavorite!;
                        bool isFavorite = movie.isFavorite!;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.bookmark,
                              color: isFavorite
                                  ? ColorsManager.selectedTabColor
                                  : ColorsManager.bookmarkIconColor,
                              size: 50.sp,
                            ),
                            Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ],
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}

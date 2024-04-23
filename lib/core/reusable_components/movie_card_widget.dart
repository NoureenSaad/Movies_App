import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/constants.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';
import 'package:movies_app/core/firebase/providers/auth_provider.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import '../../presentation/home/details/movie_details/widgets/movie_details_widget.dart';

class MovieCardWidget extends StatefulWidget {
  MoviesEntity moviesEntity;

  MovieCardWidget({super.key, required this.moviesEntity});

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
            Image.network(
              height: 199.h,
              '${Constants.imagePathBaseUrl}${widget.moviesEntity.posterPath}',
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(REdgeInsets.only(right: 30,bottom: 48)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
              ),
                onPressed: () {
                    if (widget.moviesEntity.isFavorite ?? false) {
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
                                title: widget.moviesEntity.title
                            ));
                      });
                    }
                },
                child: StreamBuilder(
                    stream: FireStoreHelper.isFavoriteCheck(userID: FirebaseAuth.instance.currentUser!.uid, id: widget.moviesEntity.id.toString()),
                    builder: (context , snapshot){
                      MoviesEntity movie = snapshot.data?? MoviesEntity();
                      bool isFavorite = movie.isFavorite!;
                      return SvgPicture.asset(
                        (isFavorite)
                            ? "assets/images/favorite.svg"
                            : "assets/images/not_favorite.svg",
                      );
                    }
                )
              )
          ],
        ),
      ),
    );
  }
}

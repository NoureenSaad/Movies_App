import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/core/reusable_components/long_movie_card_widget.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:movies_app/presentation/home/tabs/watchlist_tab/view_model/watchlist_view_model.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> getIt<WatchListViewModel>()..getMovies(FirebaseAuth.instance.currentUser!.uid),
        child: BlocBuilder<WatchListViewModel,WatchlistState>(
          builder: (context,state){
            if(state is WatchlistSuccessState){
              Stream<List<MoviesEntity>> result = state.movies;
              return StreamBuilder(
                stream: result,
                builder: (context,snapshot){
                  var movie = snapshot.data;
                  return ListView.separated(
                    separatorBuilder: (context,index)=>Container(color: Colors.white.withOpacity(0.4),height: 1.h,width: double.infinity,),
                    itemBuilder: (context,index)=>Padding(
                      padding: REdgeInsets.all(16),
                      child: LongMovieCardWidget(
                        movie: movie![index],
                      ),
                    ),
                    itemCount: movie?.length ?? 0,
                  );
                },
              );
            }
            if(state is WatchlistErrorState){
              return Center(child: Text(state.error.toString()));
            }
            return const Center(child: CircularProgressIndicator(),);
          },
        ),
      );
  }
}

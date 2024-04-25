import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/reusable_components/long_movie_card_widget.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/genre_view_model.dart';
import '../../../../../core/DI/di.dart';
import '../../../../../domain/entities/MoviesGenreEntity.dart';
import '../../../details/movie_details/widgets/movie_details_widget.dart';

class SpecificGenreListWidget extends StatelessWidget {
  const SpecificGenreListWidget({super.key });

  @override
  Widget build(BuildContext context) {
    print('---*---');
    MoviesGenreEntity? genreEntity= ModalRoute.of(context)?.settings.arguments as MoviesGenreEntity?;
    return Scaffold(
      appBar: AppBar(
        title: Text(genreEntity?.name??"",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: BlocProvider(
        create: (context)=>getIt<GenreViewModel>()..getSpecificGenre((genreEntity?.id??'').toString()),
        child: BlocConsumer<GenreViewModel,GenreSelectedStates>(
          buildWhen: (prevState , currState){
            if(currState is  GenreSelectedSuccessState){
              return true;
            }
            return false;
          },
          listenWhen: (prevState,currState){
            if(currState is GenreSelectedSuccessState || currState is GenreSelectedLoadingState || currState is GenreSelectedErrorState){
              return true;
            }
            return false;
          },
          builder: (context,state){
            if(state is GenreSelectedSuccessState){
              return ListView.separated(
                separatorBuilder: (context,index)=>Container(color: Colors.white.withOpacity(0.4),height: 1.h,width: double.infinity,),
                itemCount: state.specificGenre.length,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        if (state.specificGenre[index].id != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movieId: state.specificGenre[index].id!,
                                moviesEntity: state.specificGenre[index],
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
                      child: Padding(
                        padding: REdgeInsets.all(16.0),
                        child: LongMovieCardWidget(movie: state.specificGenre[index]),
                      ),
                    );
                  }
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
          listener: (context,state){
            if(state is GenreSelectedErrorState){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: Text(state.error),
                );
              });
            }
            if(state is GenreSelectedSuccessState){
              //Navigator.pop(context);
            }
            if(state is GenreSelectedLoadingState){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                    height: 90.h,
                    child: Center(child: CircularProgressIndicator(),),
                  ),
                );
              },);
            }
          },
        ),
      ),
    );
  }
}

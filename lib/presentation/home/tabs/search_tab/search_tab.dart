import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/home/tabs/search_tab/search_viewModel.dart';
import '../../../../core/DI/di.dart';
import '../../../../core/reusable_components/long_movie_card_widget.dart';

class SearchTab extends StatelessWidget {
  TextEditingController textCon = TextEditingController();
   SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchViewModel>(),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(8.0),
            child: TextField(
              controller: textCon,
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: (){
                        getIt<SearchViewModel>().search(textCon.text);
                      },
                      child: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          BlocBuilder<SearchViewModel,SearchState>(
            builder:(context,state){
              if(state is SearchSuccessState){
                print("/////////////////////////////////");
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context , index){
                        return LongMovieCardWidget(movie: state.moviesList![index]);
                      },
                      separatorBuilder: (context,index)=>SizedBox(height: 20,),
                      itemCount: state.moviesList!.length
                  ),
                );
              }
              else if (state is SearchErrorState) {
                return Center(
                  child: Text(
                    'Error: ${state.errorMessage}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            } ,

          ),
        ],
      ),
    );
  }
}

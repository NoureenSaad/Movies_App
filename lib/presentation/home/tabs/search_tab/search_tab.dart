import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/presentation/home/tabs/search_tab/search_viewModel.dart';
import '../../../../core/DI/di.dart';
import '../../../../core/reusable_components/long_movie_card_widget.dart';
import '../../../../domain/entities/MoviesEntity.dart';
import '../../details/movie_details/widgets/movie_details_widget.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchViewModel>()..search(''),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<SearchViewModel>(context).search(value);
              },
              decoration: InputDecoration(
                hintText: 'Search for movies...',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: Padding(
                  padding: REdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/svg/Search.svg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchViewModel, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {

                } else if (state is SearchErrorState) {
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
              },
            ),
          ),
        ],
      ),
    );
  }

// Widget _buildMovieList(BuildContext context, List<MoviesEntity>? movies) {
//   return ListView.builder(
//     itemCount: movies?.length ?? 0,
//     itemBuilder: (context, index) {
//       MoviesEntity? movie = movies?[index];
//       return ListTile(
//         title: Text(movie?.title ?? ''),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => MovieDetailsScreen(movieId: movie?.id ?? 0,moviesEntity: movie!,),
//             ),
//           );
//         },
//       );
//     },
//   );
// }
}

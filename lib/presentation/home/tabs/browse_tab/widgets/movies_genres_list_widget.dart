import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart';
import 'movie_genre_widget.dart';

class MoviesGenresListWidget extends StatefulWidget {
  const MoviesGenresListWidget({super.key});

  @override
  State<MoviesGenresListWidget> createState() => _MoviesGenresListWidgetState();
}

class _MoviesGenresListWidgetState extends State<MoviesGenresListWidget> {
  List<String> imagePaths = [
    AssetsManager.actionGenre,
    AssetsManager.adventureGenre,
    AssetsManager.animationGenre,
    AssetsManager.comedyGenre,
    AssetsManager.crimeGenre,
    AssetsManager.docGenre,
    AssetsManager.dramaGenre,
    AssetsManager.familyGenre,
    AssetsManager.fantasyGenre,
    AssetsManager.historyGenre,
    AssetsManager.horrorGenre,
    AssetsManager.musicGenre,
    AssetsManager.mysteryGenre,
    AssetsManager.romanceGenre,
    AssetsManager.sfGenre,
    AssetsManager.tvGenre,
    AssetsManager.thrillerGenre,
    AssetsManager.warGenre,
    AssetsManager.westernGenre
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<BrowseTabViewModel>().getMoviesGenres();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BrowseTabViewModel, BrowseTabStates>(
      buildWhen: (prevState, currentState) {
        // print("Build When");
        if (currentState is BrowseTabSuccessState) {
          return true;
        }
        return false;
      },
      listenWhen: (prevState, currentState) {
        // print("Listen When");
        if (currentState is BrowseTabSuccessState ||
            currentState is BrowseTabErrorState ||
            currentState is BrowseTabLoadingState) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state is BrowseTabLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: SizedBox(
                  height: 90.h,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        }
        if (state is BrowseTabErrorState) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.error),
              );
            },
          );
        }
        if (state is BrowseTabSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is BrowseTabSuccessState) {
          // print("Success");
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 10.w),
              itemCount: state.genres.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesManager.specificGenreListScreen,
                          arguments: state.genres[index]);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: MovieGenreWidget(
                        movieGenre: state.genres[index],
                        imagePath: imagePaths[index],
                      ),
                    ));
              });
        }
        // print("Not Success");
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

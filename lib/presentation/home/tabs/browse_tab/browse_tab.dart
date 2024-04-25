import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/DI/di.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/view_model/browse_tab_view_model.dart';
import 'package:movies_app/presentation/home/tabs/browse_tab/widgets/movies_genres_list_widget.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => getIt<BrowseTabViewModel>(), //field injection
          child: Padding(
              padding: REdgeInsets.only(top:25,left: 20,right: 20),
              child:  const MoviesGenresListWidget(),

          ),
        ),
      ),
    );
  }
}
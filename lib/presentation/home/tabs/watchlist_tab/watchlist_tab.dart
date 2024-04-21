import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/firebase/helper/firestore_helper.dart';
import 'package:movies_app/core/firebase/providers/auth_provider.dart';
import 'package:movies_app/core/reusable_components/long_movie_card_widget.dart';
import 'package:movies_app/domain/entities/MoviesEntity.dart';
import 'package:provider/provider.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FireStoreHelper.ListenToWatchList(FirebaseAuth.instance.currentUser!.uid),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            //Loading
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasError){
            //Error
            return Column(
              children: [
                Text("There Is An Error!!"),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Try Again"))
              ],
            );
          }
          // Data Returned Successfully
          List<MoviesEntity> movies = snapshot.data??[];
          return ListView.separated(
            separatorBuilder: (context,index)=>Container(color: Colors.white.withOpacity(0.4),height: 1.h,width: double.infinity,),
            itemBuilder: (context,index)=>InkWell(
              onTap: (){
                //todo: navigate to details
              },
              child: Padding(
                padding: REdgeInsets.all(16),
                child: LongMovieCardWidget(
                  movie: movies[index],
                ),
              ),
            ),
            itemCount: movies.length,
          );
        },
      ),
    );
  }
}

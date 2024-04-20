import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
          return ListView.builder(
            itemBuilder: (context,index)=>LongMovieCardWidget(
              movie: movies[index],
            ),
            itemCount: movies.length,
          );
        },
      ),
    );
  }
}

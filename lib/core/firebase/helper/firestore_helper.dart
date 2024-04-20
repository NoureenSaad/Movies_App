import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/model/user_model/user_model.dart';
import '../../../domain/entities/MoviesEntity.dart';

class FireStoreHelper {
  //create users collection if there is no collection with that name
  static CollectionReference<UserModel> getUserCollection() {
    CollectionReference<UserModel> userRef =
        FirebaseFirestore.instance.collection('Users').withConverter(
      fromFirestore: (snapshot, option) {
        Map<String, dynamic> data = snapshot.data()!;
        return UserModel.fromFirestore(data);
      },
      toFirestore: (userModel, option) {
        return userModel.toFirestore();
      },
    );
    return userRef;
  }

  static Future<void> addUser(
      String email, String fullName, String userID) async {
    DocumentReference<UserModel> userDoc = getUserCollection().doc(userID);
    await userDoc.set(
      UserModel(
        id: userID,
        email: email,
        fullName: fullName,
      ),
    );
  }

  static Future<UserModel?> getUser(String userID) async {
    DocumentReference<UserModel> userDoc = getUserCollection().doc(userID);
    DocumentSnapshot<UserModel> snapshot = await userDoc.get();
    UserModel userModel = snapshot.data()!;
    return userModel;
  }

  static CollectionReference<MoviesEntity> getWatchList(String userID) {
    var reference = getUserCollection()
        .doc(userID)
        .collection('WatchList')
        .withConverter(
            fromFirestore: (snapshot, options) =>
                MoviesEntity.fromFirestore(snapshot.data() ?? {}),
            toFirestore: (movie, options) => movie.toFirstore());
    return reference;
  }

  static Future<void> addToWatchList(String userID, MoviesEntity movie) async {
    var reference = getWatchList(userID);
    print(reference.id);
    var movieDocument = reference.doc();
    print(movieDocument.id);
    movie.movieID = movieDocument.id;
    print('--->'+movie.isFavorite.toString());
    print(movie.releaseDate);
    print(movie.title);
    await movieDocument.set(movie);
  }

  static Future<List<MoviesEntity>> getAllMovies(String userID) async {
    var movieQuery = await getWatchList(userID).get();
    List<MoviesEntity> moviesList =
        movieQuery.docs.map((snapshot) => snapshot.data()).toList();
    return moviesList;
  }

  static Future<void> deleteMovie(String userID, String movieID) async {
    await getWatchList(userID).doc(movieID).delete();
  }

  static Stream<List<MoviesEntity>> ListenToWatchList(String userID) async*{
    Stream<QuerySnapshot<MoviesEntity>> movieQueryStream =
        getWatchList(userID).snapshots();
    Stream<List<MoviesEntity>> movieStream = movieQueryStream.map(
        (querySnapshot) =>
            querySnapshot.docs.map((documents) => documents.data()).toList());
    yield* movieStream;
  }
}
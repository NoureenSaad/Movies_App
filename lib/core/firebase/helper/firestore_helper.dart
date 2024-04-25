import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import '../../../data/model/user_model/user_model.dart';
import '../../../domain/entities/MoviesEntity.dart';

@singleton
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
    var reference = getWatchList(userID).doc(movie.id.toString()).set(movie);
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

  static Stream<MoviesEntity> isFavoriteCheck(
      {required String userID, required String id}) async* {
    DocumentReference<MoviesEntity> filter = getWatchList(userID).doc(id);
    Stream<MoviesEntity> snapshot = filter
        .snapshots()
        .map((event) => event.data() ?? MoviesEntity(isFavorite: false));
    yield* snapshot;
  }

  Stream<List<MoviesEntity>> ListenToWatchList(String userID) async* {
    Stream<QuerySnapshot<MoviesEntity>> movieQueryStream =
        getWatchList(userID).snapshots();
    Stream<List<MoviesEntity>> movieStream = movieQueryStream.map(
        (querySnapshot) =>
            querySnapshot.docs.map((documents) => documents.data()).toList());
    yield* movieStream;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  Future<UserCredential> createNewUser({
    required String email,
    required String password,
    required String fullName,
    required String confirmedPassword
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return credential;
  }
}

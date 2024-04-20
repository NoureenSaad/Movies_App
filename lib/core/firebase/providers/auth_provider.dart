import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../../data/model/user_model/user_model.dart';
import '../helper/firestore_helper.dart';

class AuthProviders extends ChangeNotifier {
  User? firebaseUserAuth;
  UserModel? databaseUser;


  void setUsers(User? newFirebaseUserAuth, UserModel? newDatabaseUser) {
    firebaseUserAuth = newFirebaseUserAuth;
    databaseUser = newDatabaseUser;
  }

  bool isFirebaseUserLoggedIn() {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    }
    firebaseUserAuth = FirebaseAuth.instance.currentUser;
    return true;
  }

  Future<void> retrieveDatabaseUserData()async{
    try{
      databaseUser = await FireStoreHelper.getUser(firebaseUserAuth!.uid);
    }catch(error){
      print(error);
    }
  }

  Future<void> signOut() async {
    firebaseUserAuth = null;
    databaseUser = null;
    return await FirebaseAuth.instance.signOut();
  }
}
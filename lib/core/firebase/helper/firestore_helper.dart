import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/model/user_model/user_model.dart';

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

  static Future<void> addUser(String email, String fullName, String userID) async {
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
}
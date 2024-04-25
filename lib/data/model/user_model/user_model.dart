class UserModel {
  String? id;
  String? fullName;
  String? email;
  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
  });

  //get data from firestore and change it into object
  UserModel.fromFirestore(Map<String, dynamic> userData) {
    id = userData['id'];
    email = userData['email'];
    fullName = userData['full_name'];
  }

  //get data from app as an object and change it into map to firestore
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
    };
  }


}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_tasks/core/models/users_model.dart';
import 'base_users_repository.dart';


class UsersRepository extends BaseUsersRepository {
  FirebaseFirestore _firestore;
  // -- Firebase firestore instance initialization
  UsersRepository({FirebaseFirestore? firebaseFirestore})
      : _firestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Future<String> save() {
    var db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

    return Future.value("");
  }

  @override
  Future<User> getUserByUid(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot= await _firestore.collection("users").doc(uid).get();
    final userData = docSnapshot.data() as Map<String, dynamic>;
    return User.fromJson(userData);
  }

  @override
  Future<String> saveUser(User userToAdd) async {
    DocumentReference doc = await _firestore.collection("users").add(userToAdd.toJson());
    print("User added successfully with Id ${doc.id}") ;
    return doc.id;
  }

  @override
  Future<User> searchUserByPhoneNumber(String phoneNumber) async {
    final querySnapshot = await _firestore .collection("users")
        .where("phoneNumber", isEqualTo : phoneNumber)
        .get();

    if(querySnapshot.docs.isNotEmpty){
      final userData = querySnapshot.docs[0] as Map<String, dynamic>;
      return User.fromJson(userData);
    }
    return User(uid: "", phoneNumber: "");
  }

}
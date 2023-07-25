import '../models/users_model.dart';

abstract class BaseUsersRepository{
  ///to sacve new user to firestore database
  Future<String> save();
  ///to save a new user to firestore database
  Future<String> saveUser(User userToAdd);
  ///to get User from firestore by uid
  Future<User> getUserByUid(String uid);
  ///to search user by phone number
  Future<User> searchUserByPhoneNumber(String phoneNumber);
}
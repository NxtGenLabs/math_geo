import 'package:firebase_auth/firebase_auth.dart';
import 'package:math_geometry/services/database.dart';
import 'package:math_geometry/services/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String tempFullName = '';
  String tempPassword = '';

  MyUser? _userFromFirebaseUser(User user) {
    return user != null ? MyUser(user.uid) : null;
  }

  Future signInWithEmailAndPassword(String fullname, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: '$fullname@donald.com', password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register new user
  Future registerWithEmailAndPassword(String fullname, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: '$fullname@donald.com', password: password);
      User user = result.user!;

//creating document for new user
      await DataBaseService(user.uid).updateUserData(0, 1, 0);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  storeUsernameAndPassword(String fullname, String password) {
    tempFullName = fullname;
    tempPassword = password;
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}

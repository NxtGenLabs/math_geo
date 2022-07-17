import 'package:firebase_auth/firebase_auth.dart';
import 'package:math_geometry/services/user.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User user){
    return user != null ? MyUser(user.uid) : null;
  }

  Future registerWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: '', password: '');
      User user = result.user!;

    } catch(e) {

    }
  }
}
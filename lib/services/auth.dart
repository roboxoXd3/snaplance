import 'package:firebase_auth/firebase_auth.dart';
import 'package:snaplance/models/user.dart';

class AuthService {
  //This is provided by Firebase to authrize users
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object from firebase user;
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User() : null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  //Register with Email and Password
  Future registerWithEmailandPassword(String Email, String Password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Signin with Email and Password
  Future signInWithEmailandPassword(String Email, String Password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //SignOut Users
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

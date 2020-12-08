// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaplance/Screens/Authrization/Signup.dart';
import 'package:snaplance/Screens/Authrization/login.dart';
import 'package:snaplance/Screens/FirstPage.dart';
import 'package:snaplance/Screens/HomeScreen.dart';
import 'package:snaplance/models/user.dart';

// import 'Authrization/login.dart';
// import 'HomeScreen.dart';

class LandingPage extends StatefulWidget {
  static const id = "LandingPage";
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return Container();
    if (user == null) {
      return Login();
    } else {
      return HomeScreen();
    }
//        return StreamBuilder(
//       stream: FirebaseAuth.instance.onAuthStateChanged,
//       builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
//         if (snapshot.hasData) {
// //          preferences =  SharedPreferences.getInstance();
//           return HomeScreen();
//         } else {
//           return Login();
//         }
//       },
//     );
  }
}

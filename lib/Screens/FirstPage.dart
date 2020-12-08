// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:snaplance/Style/font.dart';
// import 'package:snaplance/services/auth.dart';

// import 'HomeScreen.dart';
// import 'Photographers.dart';
// import 'UserProfile.dart';

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   Widget _child;
//   final AuthService _auth = AuthService();

//   @override
//   void initState() {
//     // TODO: implement initState
//     _child = HomeScreen();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Snaplance",
//           style: kSplashFont.copyWith(color: Colors.black, fontSize: 30),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.logout,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               _auth.signOut();
//             },
//           ),
//         ],
//       ),
//       body: _child,
//       bottomNavigationBar: FluidNavBar(
//         // (1)
//         icons: [
//           // (2)
//           FluidNavBarIcon(svgPath: "assets/home.svg"), // (3)
//           FluidNavBarIcon(svgPath: "assets/bookmark.svg"),
//         ],
//         onChange: _handleNavigationChange,
//         style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
//         scaleFactor: 1.5,
//         defaultIndex: 1,
//         itemBuilder: (icon, item) => Semantics(
//           label: icon.extras["label"],
//           child: item,
//         ),
//       ),
//     );
//   }

//   void _handleNavigationChange(int index) {
//     setState(() {
//       switch (index) {
//         case 0:
//           _child = HomeScreen();
//           break;
//         case 1:
//           _child = Photographers();
//           break;
//         case 2:
//           _child = UserProfile();
//       }
//       _child = AnimatedSwitcher(
//         switchInCurve: Curves.easeOut,
//         switchOutCurve: Curves.easeIn,
//         duration: Duration(milliseconds: 500),
//         child: _child,
//       );
//     });
//   }
// }

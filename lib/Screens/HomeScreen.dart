import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snaplance/Screens/BookingForm.dart';
import 'package:snaplance/Screens/newsfeedLayout.dart';
import 'package:snaplance/Style/Colors.dart';
import 'package:snaplance/Style/font.dart';
import 'package:snaplance/services/auth.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

import 'PhotographerDetails.dart';
import 'Photographers.dart';
import 'UserProfile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _child;
  final AuthService _auth = AuthService();
  String stringValue = " ";
  List<String> names = [
    'Rishav',
    'Asif',
    'Nikhil',
    'Sanskriti',
    'Chirag',
  ];
  List<String> rating = [
    '5.0',
    '4.8',
    '4.9',
    '4.8',
    '4.9',
  ];
  List<String> location = [
    'Delhi',
    'Udaypur',
    'Jodhpur',
    'Kasol',
    'Chopta',
  ];
  List<String> Price = [
    '1000',
    '1100',
    '900',
    '800',
    '950',
  ];
  List<String> imageLinks = [
    'https://images.unsplash.com/photo-1602524812702-75d79587486d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=751&q=80',
    'https://images.unsplash.com/photo-1516283182395-4b90237bff2e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1457486276849-3f731d701f32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
    'https://images.unsplash.com/photo-1549981832-2ba2ee913334?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    'https://images.unsplash.com/photo-1528788923685-864db0cbc312?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzh8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ];
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    stringValue = prefs.getString('stringValue');
    return stringValue;
  }

  @override
  void initState() {
    // TODO: implement initState
    _child = HomeScreen();
    super.initState();
    setState(() {
      getStringValuesSF();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfile()),
                      );
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: ColorizeAnimatedTextKit(
                            duration: Duration(seconds: 3),
                            isRepeatingAnimation: false,
                            text: ['Snaplance '],
                            textStyle: TextStyle(
                                fontFamily: 'Lemonanda',
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                            colors: [
                              Colors.brown.shade300,
                              Colors.black,
                              Colors.yellow
                              // Color(0xfffffff),
                              // Colors.green[800]
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 10,
                              shape: CircleBorder(),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  // gradient: kGradientColor,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'asset/images/photographerProfilePic.jpg'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Roboxo",
                                style: kSplashFont.copyWith(
                                    fontSize: 30,
                                    color: Colors.brown.shade300,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.black12,
                  thickness: 2,
                ),
                Expanded(
                  flex: 4,
                  child: ListView(
                    children: [
                      DrawerItems(
                        icon: Icons.home,
                        name: "Home",
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      DrawerItems(
                        icon: Icons.info,
                        name: "My Profile",
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile()));
                        },
                      ),
                      DrawerItems(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Photographers();
                          }));
                        },
                        icon: Icons.photo_album,
                        name: "Hire Photographers",
                      ),
                      DrawerItems(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return BookingFrom();
                          }));
                        },
                        icon: Icons.event_busy_rounded,
                        name: "Book Photo Shoot",
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 20,
                  color: Colors.black12,
                  thickness: 2,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/images/logout.png',
                        color: Colors.black,
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              elevation: 10,
                              title: Text(
                                "Sure to Logout?",
                                style: kSplashFont.copyWith(
                                    color: Colors.brown.shade300),
                              ),
                              actions: [
                                FlatButton(
                                  color: Colors.brown.shade300,
                                  child: Text("Yes"),
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                    _auth.signOut();
                                  },
                                ),
                                FlatButton(
                                  color: Colors.brown.shade300,
                                  child: Text("NO"),
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          " Logout",
                          style: kSplashFont.copyWith(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Snaplance",
          style: kSplashFont.copyWith(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.brown.shade300,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Hi, $stringValue",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontFamily: 'Lemonanda',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
//                             Padding(
                          ],
                        ),
                        Card(
                          elevation: 10,
                          shape: CircleBorder(),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              // gradient: kGradientColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'asset/images/photographerProfilePic.jpg'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.orange,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Welcome to SnapLance",
                          style: TextStyle(
//                        fontSize: 25,
                            color: Colors.white,
                            fontFamily: 'Lemonanda',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                "Trending Photographers",
                style: kSplashFont.copyWith(color: Colors.brown, fontSize: 30),
              ),
            ),
            ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),

              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PhotographerDetail(
                                  image: imageLinks[index],
                                  name: names[index],
                                  rating: rating[index])),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: EdgeInsets.all(8.0),
                        child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            ///Always remember if you want to have text to take multiple lines the column in which the text is must be wrapped with flexible widget.
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      child: Image.network(imageLinks[index])),
                                ),
                              ),
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width * 0.5,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        names[index],
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Varela'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Rating:" + rating[index],
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        "Location: " + location[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Varela'),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Text(
                                        "Rate: " + Price[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Varela'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ), //this container is to display each news
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItems extends StatelessWidget {
  final String name;
  final Function onTap;
  final IconData icon;

  const DrawerItems(
      {Key key, @required this.name, @required this.onTap, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: kSplashFont.copyWith(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

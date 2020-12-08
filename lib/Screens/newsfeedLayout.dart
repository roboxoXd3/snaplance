import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:snaplance/Style/Palette.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  List<String> names = [
    'Roboxo',
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
    'https://images.unsplash.com/photo-1602524812702-75d79587486d?ixlib=rb-1.2.1&ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=751&q=80'
        'https://images.unsplash.com/photo-1516283182395-4b90237bff2e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjR8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'
        'https://images.unsplash.com/photo-1457486276849-3f731d701f32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'
        'https://images.unsplash.com/photo-1549981832-2ba2ee913334?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80'
        'https://images.unsplash.com/photo-1528788923685-864db0cbc312?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzh8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.all(8.0),
                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Always remember if you want to have text to take multiple lines the column in which the text is must be wrapped with flexible widget.
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                names[index],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Varela'),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              rating[index],
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .subhead
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Text(
                                location[index],
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
                                Price[index],
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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            child: Image.asset(
                                'asset/images/photographerProfilePic.jpg')),
                      ),
                    ),
                  ],
                ),
              ),
            ), //this container is to display each news
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:snaplance/Style/font.dart';

import 'PhotographerDetails.dart';

class Photographers extends StatelessWidget {
  List<String> imageLink = [
    'https://images.unsplash.com/photo-1529258297641-785a413968af?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8cGhvdG9ncmFwaGVyc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1592429141138-559164149da7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8cGhvdG9ncmFwaGVyc3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1556103255-4443dbae8e5a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvdG9ncmFwaGVyfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1495745966610-2a67f2297e5e?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTV8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1516575334481-f85287c2c82d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1499417267106-45cebb7187c9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjN8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1552086231-dde3eb12cf60?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1602525962574-3bc829fbed3c?ixid=MXwxMjA3fDF8MHxzZWFyY2h8Mjl8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1438109491414-7198515b166b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzF8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1476979877450-4037538c2749?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzZ8fHBob3RvZ3JhcGhlcnxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ];
  List<String> names = [
    "Robert",
    "John",
    'Alex',
    "Serpa",
    "Serpeshwar",
    "Shobhit",
    "Samantha",
    "Soboxo",
    "Shyam Bahadur",
    "Sabeba",
  ];
  List<String> rating = [
    "4.2",
    "4.6",
    "4.8",
    "4.4",
    "4.5",
    "4.9",
    "4.0",
    "5.0",
    "4.1",
    "3.8",
  ];
  List<String> location = [
    'Delhi',
    'Udaypur',
    'Jodhpur',
    'Kasol',
    'Chopta',
    'kullu',
    "kwalalampur",
    "kurukshetra",
    "Karanataka"
        "Coimbatore"
  ];
  List<String> Price = [
    "1000",
    "1100",
    "600",
    "1200",
    "1500",
    "900",
    "1300",
    "300",
    "700",
    "950"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Snaplance",
          style: kSplashFont.copyWith(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5,
        // physics: NeverScrollableScrollPhysics(),

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
                            image: imageLink[index],
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
                                child: Image.network(imageLink[index])),
                          ),
                        ),
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.5,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}

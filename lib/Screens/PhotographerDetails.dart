import 'package:flutter/material.dart';
import 'package:snaplance/Style/font.dart';

class PhotographerDetail extends StatelessWidget {
  final String image;
  final String name;
  final String rating;
  List<String> sampleImages = [
    'https://images.unsplash.com/photo-1607019327082-6c7899d8a66d?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1607344563948-8eb7855393b0?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyOHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1607151815172-254f6b0c9b4b?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
    'https://images.unsplash.com/photo-1602525966490-52fde4686e16?ixid=MXwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60',
  ];
  PhotographerDetail(
      {@required this.image, @required this.name, @required this.rating});
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
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(image),
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Column(
                    children: [
                      Text(
                        name,
                        style: kSplashFont,
                      ),
                      Text(
                        rating,
                        style: kSplashFont.copyWith(
                            color: Colors.black, fontSize: 20),
                      ),
                      Text(
                        "Near palika bazar, New Delhi 131023. A dropout from college pursuing his degree.",
                        style: kSplashFont.copyWith(
                            color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "Work",
                style: kSplashFont,
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4 / 5,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Image.network(
                          sampleImages[index],
                          fit: BoxFit.fill,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:snaplance/Style/font.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Image.asset(
                          'asset/images/photographerProfilePic.jpg'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCredentials(
                title: "Roboxo",
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCredentials(
                title: "21, Male",
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCredentials(
                title: "Roboxo@yahoo.in",
              ),
              SizedBox(
                height: 20,
              ),
              ProfileCredentials(
                title: "9876543871",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCredentials extends StatelessWidget {
  String title;
  ProfileCredentials({this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: kSplashFont.copyWith(color: Colors.black, fontSize: 25),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}

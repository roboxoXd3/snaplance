import 'package:flutter/material.dart';
import 'package:snaplance/Screens/SubmittedPage.dart';
import 'package:snaplance/Style/font.dart';

class BookingFrom extends StatefulWidget {
  @override
  _BookingFromState createState() => _BookingFromState();
}

class _BookingFromState extends State<BookingFrom> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String number;
  String city;
  String priceRange;
  String timing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Book Appointment",
          style: kSplashFont.copyWith(color: Colors.black, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Form(
        autovalidate: true,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              BookingInputContainer(
                headline: "Name",
                hintText: "Rian",
                onSaved: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              BookingInputContainer(
                headline: "Number",
                hintText: "7054346521",
                onSaved: (value) {
                  setState(() {
                    number = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              BookingInputContainer(
                headline: "City",
                hintText: "Ludhiana",
                onSaved: (value) {
                  setState(() {
                    city = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              BookingInputContainer(
                headline: "Price range",
                hintText: "500-700",
                onSaved: (value) {
                  setState(() {
                    priceRange = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              BookingInputContainer(
                headline: "Timing",
                hintText: "Office hours or 24 hours",
                onSaved: (value) {
                  setState(() {
                    timing = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SumbittedPage()),
                    );
                  }
                },
                child: Card(
                  elevation: 10,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: kSplashFont.copyWith(color: Colors.white70),
                      )),
                    ),
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingInputContainer extends StatelessWidget {
  final String headline;
  final String hintText;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
  // final bool hidePassword;
  const BookingInputContainer({
    Key key,
    @required this.headline,
    @required this.hintText,
    this.onSaved,
    this.validator,
    this.textInputType,
    // this.hidePassword
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline,
            style: kSplashFont.copyWith(fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown.shade300),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                // obscureText: hidePassword,
                keyboardType: textInputType,
                validator: validator,
                onSaved: onSaved,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: hintText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

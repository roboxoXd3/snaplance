import 'dart:ui';
import 'package:snaplance/Screens/HomeScreen.dart';
import 'package:snaplance/Widgets/Dialogs.dart';
import 'package:snaplance/services/auth.dart';
import 'package:validators/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:snaplance/Style/font.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', name);
  }

  double sigmaX = 1; // from 0-10
  double sigmaY = 1; // from 0-10
  double opacity = 0.1;
  String name;
  String email;
  String password;
  String error = '';
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.asset('asset/images/logo.png'),
                    Container(
                      child: Text(
                        "Register",
                        style: kSplashFont.copyWith(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InputContainer(
                      headline: 'Name',
                      hintText: 'Roboxo',
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (!validator.isAlpha(value)) {
                          return "Names dont contain character";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          name = value;
                          addStringToSF();
                        });
                      },
                    ),
                    InputContainer(
                      // hidePassword: true,
                      headline: 'Email',
                      hintText: 'roboxo@abc.com',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (!validator.isEmail(value)) {
                          return "Enter a valid Email";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    InputContainer(
                      headline: 'Password',
                      hintText: 'XXXXXXXX',
                      validator: (value) {
                        if (value.length < 5) {
                          return "Password length must be greater than 5";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Dialogs.showLoadingDialog(context, _keyLoader);
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          dynamic result = await _auth
                              .registerWithEmailandPassword(email, password)
                              .then((value) =>
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
                                  })));
                          Navigator.of(_keyLoader.currentContext,
                                  rootNavigator: true)
                              .pop();
                          if (result == null) {
                            setState(() {
                              error = "Enter a valid Email";
                            });
                          } else {
                            return HomeScreen();
                          }
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
                              "Register",
                              style: kSplashFont.copyWith(
                                  color: Colors.white70, fontSize: 25),
                            )),
                          ),
                          width: MediaQuery.of(context).size.width * 0.75,
                        ),
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
        ],
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  final String headline;
  final String hintText;
  final Function onSaved;
  final Function validator;
  final TextInputType textInputType;
  // final bool hidePassword;
  const InputContainer({
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
            style: kSplashFont.copyWith(),
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

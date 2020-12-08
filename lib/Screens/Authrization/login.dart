import 'package:flutter/material.dart';
import 'package:snaplance/Style/font.dart';
import 'package:snaplance/Widgets/Dialogs.dart';
import 'package:snaplance/services/auth.dart';
import 'package:validators/validators.dart' as validator;
import 'Signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email;
  String password;
  String error = '';
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
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
                        "Login",
                        style: kSplashFont.copyWith(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InputContainer(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InputContainer(
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
                              .signInWithEmailandPassword(email, password);
                          Navigator.of(_keyLoader.currentContext,
                                  rootNavigator: true)
                              .pop();
                          if (result == null) {
                            setState(() {
                              error = "Enter a valid Email";
                            });
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
                              "Login",
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return Signup();
                        }));
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
                              "Create Account",
                              style: kSplashFont.copyWith(
                                  color: Colors.white70, fontSize: 25),
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
          ),
        ],
      ),
    );
  }
}

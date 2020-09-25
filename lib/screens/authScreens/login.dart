import 'package:PoolIIIT_mobileApp/models/http_exception.dart';
import 'package:PoolIIIT_mobileApp/providers/allUsers.dart';
import 'package:flutter/material.dart';
import '../../providers/user.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../providers/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _focusNode = FocusNode();
  String email = "";
  String password = "";
  String error = "";
  Auth _auth = new Auth();
  final _form = GlobalKey<FormState>();

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("An error occurred"),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text("Okay"),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _saveForm() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();

    try {
      dynamic result = await _auth.signInWithEmailAndPassword(
        email,
        password,
        "",
      );
      if (result == null) {
        _showError("Something went wrong!");
      }
      if (result != null) {
        print(result.username);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                ),
                Form(
                  key: _form,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_focusNode);
                        },
                        validator: (value) {
                          if (!value.endsWith("@iiitb.org")) {
                            return "Incorrect email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //curr_user.setEmail(value);
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        focusNode: _focusNode,
                        onFieldSubmitted: (value) {
                          if (value.length == 0) {
                            return "Incorrect Passowrd";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          //curr_user.setPassword(value);
                          password = value;
                          print("done!");
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: _saveForm,
                      color: Theme.of(context).accentColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/auth3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: Container(
                    height: 3.0,
                    width: MediaQuery.of(context).size.width / 3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

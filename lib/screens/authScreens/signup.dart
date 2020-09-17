import 'package:PoolIIIT_mobileApp/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

enum AuthMode { Signup, Login } //currently of no use

class SignUpPage extends StatefulWidget {
  static const String routeName = '/sign-up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  final _focusNode = FocusNode();
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _form = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _isSubmitted = false;//ensures that we don't submit twice
  User _new_user = new User(username: "", password: "", email: "");

  Future<void> _saveForm() async {
    if (!_form.currentState.validate()) {
      return;
    }
    if (_isSubmitted == false) {
      _form.currentState.save();
      await Provider.of<Auth>(
        context,
        listen: false,
      ).signup(
        _new_user.getEmail,
        _new_user.getPass,
      );
      setState(() {
        _isSubmitted = true;
      });
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
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "It's simple and fun!",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[700],
                  ),
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
                          FocusScope.of(context).requestFocus(
                            _focusNode,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username should not be null';
                          }
                        },
                        onSaved: (value) {
                          _new_user.setUsername(value);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email-id',
                        ),
                        textInputAction: TextInputAction.next,
                        focusNode: _focusNode,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_focusNode1);
                        },
                        onSaved: (value) {
                          _new_user.setEmail(value);
                        },
                        validator: (value) {
                          if (!value.endsWith("@iiitb.org")) {
                            return 'Please use your college email-id only';
                          }
                          if (value.isEmpty || !value.contains("@")) {
                            return 'Please enter a valid email address';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        focusNode: _focusNode1,
                        controller: _passwordController,
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_focusNode2);
                        },
                        onSaved: (value) {
                          _new_user.setPassword(value);
                        },
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Password too short!';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                        ),
                        focusNode: _focusNode2,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                        onSaved: (value) {
                          print("done!");
                        },
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return 'Password does not match';
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    child: RaisedButton(
                      onPressed: _saveForm,
                      elevation: 6.0,
                      padding: EdgeInsets.all(10.0),
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?"),
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
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

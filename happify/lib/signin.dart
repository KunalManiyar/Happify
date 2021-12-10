import 'dart:async';

import 'package:flutter/material.dart';
import 'package:happify/Services/AuthenticationServices.dart';
import 'profile.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // This widget is the root of your application.
  final _key = GlobalKey<FormState>();
  final AuthenticationService _auth=AuthenticationService();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var details = {
  'email':'',
  'password':'',
  };
  String _text="";
    
   
  
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset :false,
          appBar: AppBar(
          
            title: Text(
              "SIGN IN",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          body: Container(
       
        child: Center(
          child: Form(
            key: _key,
            child: Column(
         
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      
                      TextFormField(
                        controller: _emailContoller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else
                          details['email']=_emailContoller.text;
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20)),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else{
                            details['password']=_passwordController.text;
                            return null;
                          }
                            
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                        style: TextStyle(
                          color: Colors.black,
                          
                        ),
                      ),
                      SizedBox(height: 60.0),
                
                SizedBox(
                    height: 45.0,
                    width: 300.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.orange[600],
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 22.0,
                        ) ,
                        ),
                      onPressed: () {
                      if (_key.currentState!.validate()) {
                        signInUser();
                      } 
                    },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    )),
                SizedBox(height: 50.0),
                Text(
                  "Or Sign Up Using",
                  style: TextStyle(fontSize: 22.0, color: Colors.black),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 150.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context,
                          '/signup'
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ),
      ),
    );
  }

  void signInUser() async{
     dynamic authResult = await _auth.loginUser(
        _emailContoller.text, _passwordController.text);
    if (authResult == null) {
      print('Invalid Credentials');
    } else {
      print(authResult.toString());
      _passwordController.clear();
      _emailContoller.clear();
      Navigator.pushNamed(
          context,
          '/friends', 
      );
    }
  }
}




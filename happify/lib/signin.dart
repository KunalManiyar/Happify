import 'package:flutter/material.dart';
import 'profile.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // This widget is the root of your application.
  var details = {
  'emailId':'',
  'password':'',
  };
  String _text="";
    void _onEmailChange(String value){
      setState(() => details['emailId']=value);
    }
    void _onPasswordChange(String value){
      setState(() => details['password']=value);
    }
   
  
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
            leading: GestureDetector(
              child: Icon(Icons.menu),
            ),
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
            padding: EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email id',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                           onChanged: _onEmailChange,
                            decoration: InputDecoration(
                              hintText: 'john_doe@gmail.com',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: _isObscure,
                            onChanged: _onPasswordChange,
                            decoration: InputDecoration(
                              hintText: 'xxxxxx',
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
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60.0),
                 Text(
                    _text,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                      if(details['emailId']==""||details['password']==""){
                        setState(() =>_text="Please Enter all details");
                      }
                      else{

                         Navigator.pushNamed(
                          context,
                          '/friends',
                          arguments: details,
                      );
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // This widget is the root of your application.
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
          appBar: AppBar(
            leading: GestureDetector(
              child: Icon(Icons.menu),
            ),
            title: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          body: Container(
            padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 10),
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
                          'Full Name',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              hintText: 'John Doe',
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
                SizedBox(height: 10.0),
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
                            onChanged: (value) {
                              //Do something with the user input.
                            },
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
                SizedBox(height: 10.0),
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
                            onChanged: (value) {
                              //Do something with the user input.
                            },
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
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: _isObscure,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
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
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Country/Religion',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              hintText: 'India',
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
                SizedBox(height: 10.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile No',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: (value) {
                              //Do something with the user input.
                            },
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
                SizedBox(height: 20.0),
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
                      ),
                    ),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
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

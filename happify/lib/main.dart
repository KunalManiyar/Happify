import 'package:flutter/material.dart';

void main() {
  runApp(SignIn());
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        home: Scaffold(
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
                        ),
                      ),
                      onPressed: () {},
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
                      // Respond to button press
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

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[600],
        ),
        body: Container(
          padding: EdgeInsets.all(36.0),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100.0),
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange[600],
                      radius: 100,
                      child: Icon(
                        Icons.person,
                        size: 180.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 70.0,
                    width: 70.0,
                    margin: EdgeInsets.only(top: 220.0, left: 140.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(
                        Icons.add,
                        size: 60,
                      ),
                      backgroundColor: Colors.orange[600],
                    ),
                  ),
                ],
              ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 185.0),
                    child: SizedBox(
                        height: 45.0,
                        width: 300.0,
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.orange[600],
                          child: Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                        )),
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

class Invites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(
              "Invite Friends",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          body: ListView(
            addAutomaticKeepAlives: true,
            children: [
              for (var i = 1; i < 10; i++)
                Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    height: 50,
                    child: Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.orange[600],
                            radius: 50,
                            child: Icon(
                              Icons.person,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text('Name' + i.toString(),
                            style: TextStyle(fontSize: 22)),
                        SizedBox(width: 130),
                        RaisedButton(
                          textColor: Colors.white,
                          color: Colors.orange[600],
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              "Invite",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                        ),
                      ],
                    )),
            ],
          )),
    );
  }
}

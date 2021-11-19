import 'package:flutter/material.dart';
import 'package:happify/signup.dart';
import 'package:provider/provider.dart';
import 'signin.dart';
import 'profile.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // This widget is the root of your application.
  
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    context.read<UserDetails>().setUserDetails();
    print("In settings page");
    print(context.watch<UserDetails>().userDetails);
    
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
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context),
            ), 
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          body: Container(
            padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
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
                          height: 60.0,
                          width: 60.0,
                          margin: EdgeInsets.only(top: 150.0, left: 140.0),
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
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontSize: 20),
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
                                // vertical: 10.0,
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
                          style: TextStyle(fontSize: 20),
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
                                // vertical: 10.0,
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
                          style: TextStyle(fontSize: 20),
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
                                // vertical: 10.0,
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
                          style: TextStyle(fontSize: 20),
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
                                // vertical: 10.0,
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
                // SizedBox(
                //   height: 45.0,
                //   width: 300.0,
                //   child: RaisedButton(
                //     textColor: Colors.white,
                //     color: Colors.orange[600],
                //     child: Text(
                //       "Submit",
                //       style: TextStyle(
                //         fontSize: 20.0,
                //       ),
                //     ),
                //     onPressed: () {},
                //     shape: new RoundedRectangleBorder(
                //       borderRadius: new BorderRadius.circular(30.0),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

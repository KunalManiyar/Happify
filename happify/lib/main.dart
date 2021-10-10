import 'package:flutter/material.dart';
import 'package:happify/main.dart';
import 'profile.dart';
import 'signin.dart';
import 'signup.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(Setting());
}

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
              "Settings",
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
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Stack(
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

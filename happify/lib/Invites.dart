import 'package:flutter/material.dart';
import 'package:happify/DatabaseManager/DatabaseManager.dart';
import 'package:happify/services/AuthenticationServices.dart';
import 'Users.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Invited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Invites(),
    );
  }
}


class Invites extends StatefulWidget {
  const Invites({Key? key}) : super(key: key);

  @override
  _InvitesState createState() => _InvitesState();
}

class _InvitesState extends State<Invites> {
  final AuthenticationService _auth = AuthenticationService();
 
  List userProfileList = [];
  void initState() {
    super.initState();
    fetchDatabaseList();
    // fetchCurrentUser();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();
    if (resultant == null) {
      print('Unable to retrieve the list');
    } else {
      setState(() {
        userProfileList = resultant;
      });
    }
  }

  // var current_user;

  // fetchCurrentUser() async {
  //   current_user = await _auth.getUserData();
  //   if (current_user == null) {
  //     print('No user present');
  //   }
  // }

  var count = 0;
  void _incrementCounter() {
    setState(() {
      count = count + 1;
    });
    print(count);
  }

  // void _selected_users(username) {
  //   setState(() {
  //     selected.add(username);
  //   });
  // }

  // void update(){

  // }

  Widget build(BuildContext context) {
    print(userProfileList);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                " Invite",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              backgroundColor: Colors.orange[600],
              actions: <Widget>[
                if (count != 0)
                  IconButton(
                    icon: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/friends');
                    },
                  )
              ],
            ),
            body: Container(
                child: ListView.builder(
                    itemCount: userProfileList.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text(userProfileList[index]['name']),
                        leading: CircleAvatar(
                          backgroundColor: Colors.orange[600],
                          radius: 50,
                          child: Icon(
                            Icons.person,
                            size: 40.0,
                            color: Colors.white,
                          ),
                        ),
                        trailing: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.orange[600],
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              'Invite',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          onPressed: () {
                            _incrementCounter();
                            //   setState(() {
                            //     // user.send_invite = "Sent";
                            //     // user_selected.add(user.username);
                            //   });
                            //   // Navigator.pushNamed(context, '/status',
                            //   //     arguments: user_selected);
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                        ),
                      ));
                    }))));
  }
}

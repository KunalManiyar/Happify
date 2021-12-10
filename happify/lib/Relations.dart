import 'package:flutter/material.dart';
import 'package:happify/Invites.dart';
import 'package:happify/DatabaseManager/DatabaseFriendsManager.dart';
import 'package:happify/DatabaseManager/DatabaseManager.dart';
import 'package:happify/services/AuthenticationServices.dart';

class Relations extends StatefulWidget {
  const Relations({Key? key}) : super(key: key);

  @override
  _RelationsState createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  final AuthenticationService _auth = AuthenticationService();

  List userProfileList = [];
  bool invited = false;
  void initState() {
    super.initState();
    fetchUserFriends();
  }
//fetching userfriends data
  fetchUserFriends() async {
    dynamic info = await _auth.getUserFriends();
    if (info != null) {
      print(info);
      setState(() {
        userProfileList = info;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: RaisedButton(
              textColor: Colors.white,
              color: Colors.orange[600],
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  'invite',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/invites');
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
            ),
            body: ListView(
              addAutomaticKeepAlives: true,
              children: [
                for (int i = 0; i < userProfileList.length; i++)
                  Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            child: userProfileList[i]['profile'] != ""
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        userProfileList[i]['profile']),
                                    radius: 50.0,
                                  )
                                : CircleAvatar(
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
                          Text(
                            userProfileList[i]['name'],
                            // 'Name',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 130),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.orange[600],
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Wish",
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
            )));
  }
}

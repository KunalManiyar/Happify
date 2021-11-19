import 'package:flutter/material.dart';
import 'Status.dart';
import 'Users.dart';

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
  @override
  List<User> user = [
    User(username: 'Devs4', send_invite: 'Invite'),
    User(username: 'ParthShah', send_invite: 'Invite'),
    User(username: 'RajSM', send_invite: 'Invite'),
    User(username: 'Ravi#123', send_invite: 'Invite'),
  ];

  Set<String> user_selected = {};

  var count = 0;
  void _incrementCounter() {
    setState(() {
      count = count + 1;
    });
    print(count);
  }

  Widget userTemplate(user) {
    return Container(
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
            Text('${user.username}', style: TextStyle(fontSize: 22)),
            new Spacer(),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange[600],
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  '${user.send_invite}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              onPressed: () {
                _incrementCounter();
                setState(() {
                  user.send_invite = "Sent";
                  user_selected.add(user.username);
                });
                Navigator.pushNamed(context, '/status',
                    arguments: user_selected);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
              ),
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
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
            body: Column(
              children: user.map((user) => userTemplate(user)).toList(),
            )));
  }
}

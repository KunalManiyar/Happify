import 'package:flutter/material.dart';
import 'Users.dart';

class Status extends StatefulWidget {
  Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget statusTemplate(user) {
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
            Text("${user}", style: TextStyle(fontSize: 22)),
            new Spacer(),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.orange[600],
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Text(
                  "Sent",
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
        ));
  }

  Widget build(BuildContext context) {
    Set<String> selected;
    selected = ModalRoute.of(context)!.settings.arguments as Set<String>;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Center(
              child: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
            backgroundColor: Colors.orange[600],
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text("Sent Invites",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
              Column(
                  children:
                      selected.map((user) => statusTemplate(user)).toList()),
            ],
          ),
        ));
  }
}

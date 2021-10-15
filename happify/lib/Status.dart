import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
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
            body: ListView(
              addAutomaticKeepAlives: true,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Text("Invites",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ),
                for (var i = 1; i < 4; i++)
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
                          SizedBox(width: 110),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.orange[600],
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Accept",
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Text("Sent Request",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ),
                for (var i = 1; i < 4; i++)
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
                          SizedBox(width: 110),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.orange[600],
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Message",
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

import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
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

import 'package:flutter/material.dart';
import 'package:happify/Invites.dart';

class Relations extends StatefulWidget {
  const Relations({Key? key}) : super(key: key);

  @override
  _RelationsState createState() => _RelationsState();
}

class _RelationsState extends State<Relations> {
  @override
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
        )

            // body: ListView(
            //   addAutomaticKeepAlives: true,
            //   children: [
            //     for (var i = 1; i < 10; i++)
            //       Container(
            //           margin: EdgeInsets.symmetric(
            //             vertical: 10,
            //           ),
            //           height: 50,
            //           child: Row(
            //             children: [
            //               Container(
            //                 child: CircleAvatar(
            //                   backgroundColor: Colors.orange[600],
            //                   radius: 50,
            //                   child: Icon(
            //                     Icons.person,
            //                     size: 40.0,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(
            //                 width: 5.0,
            //               ),
            //               Text('Name' + i.toString(),
            //                   style: TextStyle(fontSize: 22)),
            //               SizedBox(width: 130),
            //               if (i % 3 == 0)
            //                 RaisedButton(
            //                   textColor: Colors.white,
            //                   color: Colors.orange[600],
            //                   child: Padding(
            //                     padding: EdgeInsets.all(6.0),
            //                     child: Text(
            //                       "Wish",
            //                       style: TextStyle(
            //                         fontSize: 18.0,
            //                       ),
            //                     ),
            //                   ),
            //                   onPressed: () {},
            //                   shape: new RoundedRectangleBorder(
            //                     borderRadius: new BorderRadius.circular(25.0),
            //                   ),
            //                 ),
            //             ],
            //           )),
            //   ],
            // ))
            ));
  }
}

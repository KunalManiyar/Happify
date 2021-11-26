import 'package:flutter/material.dart';
import 'package:happify/main.dart';
import 'package:happify/Services/AuthenticationServices.dart';
import 'Relations.dart';
import 'Status.dart';
import 'Events.dart';
import 'Invites.dart';

class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);

  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> with SingleTickerProviderStateMixin {
  
  @override
  late TabController _controller;
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }
  final AuthenticationService _auth = AuthenticationService();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context),
          ) ,
          title: Text(
            " Happify",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.orange[600],
          actions: [
            // IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {},
            // ),
            // PopupMenuButton(onSelected: (value) {
            //   print(value);
            // }, itemBuilder: (BuildContext context) {
            //   return [
            //       PopupMenuItem(
            //        child: TextButton(
            //         onPressed: () {
            //           Navigator.pushNamed(
            //               context,
            //               '/settings'
            //           );
            //         },
            //         child: Text(
            //           "Settings",
            //           style: TextStyle(
            //             fontSize: 18.0,
            //             color: Colors.black,
            //           ),
            //         ),
            //       ),
            //        value: "Settings")
            //     ];
            //   },
            // ),
            // RaisedButton(onPressed: (){},child: Icon(Icons.search,color: Colors.white,),color: Colors.orange[600],),
            //  RaisedButton(onPressed: (){},child: Icon(Icons.exit_to_app,color: Colors.white,),color: Colors.orange[600],)
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async{
                await _auth.signOut().then((result){
                  Navigator.pushNamed(context, '/signin');
                });
              },
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(
                  child: Text(
                'Relations',
                style: TextStyle(
                  fontSize: 21.5,
                ),
              )),
              Tab(
                  child: Text(
                'Status',
                style: TextStyle(
                  fontSize: 21.5,
                ),
              )),
              Tab(
                  child: Text('Events',
                      style: TextStyle(
                        fontSize: 21.5,
                      )))
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            Relations(),
            Status(
            ),
            Events()
          ],
        ),
      ),
    );
  }
}

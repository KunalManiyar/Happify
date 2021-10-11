import 'package:flutter/material.dart';
import 'package:happify/main.dart';
import 'profile.dart';
import 'signin.dart';
import 'signup.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

import 'Relations.dart';

void main() {
  runApp(Friends());
}

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

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            " Happify",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          backgroundColor: Colors.orange[600],
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("Settings"), value: "Settings")
              ];
            })
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
          children: [Relations(), Text('Status'), Text('Events')],
        ),
      ),
    );
  }
}

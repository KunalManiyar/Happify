import 'package:flutter/material.dart';
import 'package:happify/main.dart';
import 'package:provider/provider.dart';
import 'package:happify/settings.dart';
import 'profile.dart';
import 'signin.dart';
import 'signup.dart';
import 'Friends.dart';
import 'Invites.dart';
import 'Relations.dart';


import 'Relations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>UserDetails()),
  ],child: MyApp(),));
  // runApp(Relations());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signin',
      routes: {
        '/friends':(context)=>Friends(),
        '/relations':(context)=>Relations(),
        '/invites':(context)=>Invites(),
        '/signin':(context)=>SignIn(),
        '/profile': (context) => Profile(),
        '/signup': (context) => const SignUp(),
        '/settings':(context)=>Setting()
      },
    );
  }
}
// class Setting extends StatefulWidget {
//   const Setting({Key? key}) : super(key: key);

//   @override
//   _SettingState createState() => _SettingState();
// }

// class _SettingState extends State<Setting> {
//   // This widget is the root of your application.
//   bool _isObscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusScopeNode currentFocus = FocusScope.of(context);
//         if (!currentFocus.hasPrimaryFocus &&
//             currentFocus.focusedChild != null) {
//           currentFocus.focusedChild!.unfocus();
//         }
//       },
//       child: MaterialApp(
//         home: Scaffold(
//           appBar: AppBar(
//             leading: GestureDetector(
//               child: Icon(Icons.menu),
//             ),
//             title: Text(
//               "Settings",
//               style: TextStyle(
//                 fontSize: 30,
//               ),
//             ),
//             centerTitle: true,
//             backgroundColor: Colors.orange[600],
//           ),
//           body: Container(
//             padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 10),
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   color: Colors.red,
//                   child: Center(
//                     child: Stack(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(top: 100.0),
//                           height: 200,
//                           width: 200,
//                           child: CircleAvatar(
//                             backgroundColor: Colors.orange[600],
//                             radius: 100,
//                             child: Icon(
//                               Icons.person,
//                               size: 180.0,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 70.0,
//                           width: 70.0,
//                           margin: EdgeInsets.only(top: 220.0, left: 140.0),
//                           child: FloatingActionButton(
//                             onPressed: () {
//                               // Add your onPressed code here!
//                             },
//                             child: const Icon(
//                               Icons.add,
//                               size: 60,
//                             ),
//                             backgroundColor: Colors.orange[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Friends extends StatefulWidget {
//   const Friends({Key? key}) : super(key: key);

//   @override
//   _FriendsState createState() => _FriendsState();
// }

// class _FriendsState extends State<Friends> with SingleTickerProviderStateMixin {
//   @override
//   late TabController _controller;
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 3, vsync: this, initialIndex: 0);
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             " Happify",
//             style: TextStyle(
//               fontSize: 24,
//             ),
//           ),
//           backgroundColor: Colors.orange[600],
//           actions: [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: () {},
//             ),
//             PopupMenuButton(onSelected: (value) {
//               print(value);
//             }, itemBuilder: (BuildContext context) {
//               return [
//                 PopupMenuItem(child: Text("Settings"), value: "Settings")
//               ];
//             })
//           ],
//           bottom: TabBar(
//             controller: _controller,
//             tabs: [
//               Tab(
//                   child: Text(
//                 'Relations',
//                 style: TextStyle(
//                   fontSize: 21.5,
//                 ),
//               )),
//               Tab(
//                   child: Text(
//                 'Status',
//                 style: TextStyle(
//                   fontSize: 21.5,
//                 ),
//               )),
//               Tab(
//                   child: Text('Events',
//                       style: TextStyle(
//                         fontSize: 21.5,
//                       )))
//             ],
//             indicatorColor: Colors.white,
//           ),
//         ),
//         body: TabBarView(
//           controller: _controller,
//           children: [Relations(), Text('Status'), Text('Events')],
//         ),
//       ),
//     );
//   }
// }

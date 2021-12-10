import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:happify/Users.dart';
import 'package:happify/main.dart';
import 'package:provider/provider.dart';
import 'package:happify/settings.dart';
import 'profile.dart';
import 'signin.dart';
import 'signup.dart';
import 'Friends.dart';
import 'Invites.dart';
import 'Relations.dart';
import 'Occasions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/signin',
      routes: {
        '/occasions': (context) => Occasions(),
        '/friends': (context) => Friends(),
        '/relations': (context) => Relations(),
        '/invites': (context) => Invites(),
        '/signin': (context) => SignIn(),
        '/profile': (context) => Profile(),
        '/signup': (context) => const SignUp(),
        '/settings': (context) => Setting(),
      },
    );
  }
}

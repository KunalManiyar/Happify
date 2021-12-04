import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happify/Users.dart';

class DatabaseFriendsManager {
  final CollectionReference userFriends =
      FirebaseFirestore.instance.collection('userFriends');

  final String uid;
  DatabaseFriendsManager({required this.uid});
  Future updateUserData(Map<String, bool> friends) async {
    return await userFriends.doc(uid).set({'friends': friends});
  }

  Stream<QuerySnapshot> get friends {
    return userFriends.snapshots();
  }
}

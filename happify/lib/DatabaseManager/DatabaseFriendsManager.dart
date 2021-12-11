import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseFriendsManager {
  final CollectionReference userFriends =
      FirebaseFirestore.instance.collection('userFriends');

  Future updateUserData(String uid,List friends) async {
    return await userFriends.doc(uid).set({'friends': friends});
  }

 Future getUserFriends(uid) async {
    try {
      DocumentSnapshot ds = await userFriends.doc(uid).get();

      List friends=ds.get('friends');
      
      print(friends);
      return friends;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  Stream<QuerySnapshot> get friends {
    return userFriends.snapshots();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happify/Users.dart';

class DatabaseManager {
  final CollectionReference userInfo =
      FirebaseFirestore.instance.collection('userInfo');

  final CollectionReference userFriends=FirebaseFirestore.instance.collection('userFriends');

  Future<void> createUserData(
      String name,
      String email,
      String country,
      String profile,
      double mobileNo,
      Map<String, Map> eventsList,
      bool invited,
      String uid) async {
    return await userInfo.doc(uid).set({
      'name': name,
      'email': email,
      'country': country,
      'profile': profile,
      'mobileNo': mobileNo,
      'events': eventsList,
      'invited':invited
    });
  }

//   Stream<QuerySnapshot> get users{
//     return userInfo.snapshots();
//   }

  String current_name = " ";

  Future getCurrentUserData(uid) async {
    try {
      DocumentSnapshot ds = await userInfo.doc(uid).get();
      String name = ds.get('name');
      current_name = name;
      String email = ds.get('email');
      String country = ds.get('country');
      double mobileNo = ds.get('mobileNo');
      String profileImg=ds.get('profile');
      // String name =ds.get('name');
      return [name, email, country, mobileNo,profileImg];
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future getUsersList() async {
    List itemsList = [];
    try {
      await userInfo.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          if (element['name'] != current_name) itemsList.add(element.data());
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
 
}

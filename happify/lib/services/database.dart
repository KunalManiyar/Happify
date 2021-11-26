import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference friendCollection =
      FirebaseFirestore.instance.collection('friends');

  Future updateUserData(String username, bool invite_status) async {
    return await friendCollection
        .doc(uid)
        .set({'username': username, 'invite_status': false});
  }

  //get friend stream
  Stream<QuerySnapshot> get friend {
    return friendCollection.snapshots();
  }
}

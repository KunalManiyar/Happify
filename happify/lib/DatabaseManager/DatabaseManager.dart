import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DatabaseManager {
  final CollectionReference userInfo=FirebaseFirestore.instance.collection('userInfo');

  Future<void> createUserData(
      String name,String email, String country, double mobileNo, Map<String,Map> eventsList, String uid) async {
    return await userInfo
        .doc(uid)
        .set({'name': name,'email':email, 'country': country, 'mobileNo': mobileNo,'events':eventsList});
  }



//   Stream<QuerySnapshot> get users{
//     return userInfo.snapshots();
//   }
Future getCurrentUserData(uid) async{
  try{
    DocumentSnapshot ds=await userInfo.doc(uid).get();
    String name =ds.get('name');
    String email=ds.get('email');
    String country =ds.get('country');
    double mobileNo =ds.get('mobileNo');
    // String name =ds.get('name');
    return [name,email,country,mobileNo];
  }catch(e){
    print(e.toString());
    return null;
  }

} 
}
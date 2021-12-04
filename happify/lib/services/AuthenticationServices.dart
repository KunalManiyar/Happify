import 'package:firebase_auth/firebase_auth.dart';
import 'package:happify/DatabaseManager/DatabaseManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationService {
 final FirebaseAuth _auth=FirebaseAuth.instance;
final CollectionReference userInfo=FirebaseFirestore.instance.collection('userInfo');
 // registration with email and password

  Future createNewUser( String fullName,String email, String password,String country,String profile,double mobile, Map<String,Map> eventsList) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user=result.user;
      await DatabaseManager().createUserData(fullName,email, country,profile, mobile,eventsList, user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

  // sign with email and password
  Future loginUser(String email,String password) async {
    try{
      UserCredential result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    }catch(e){
      print(e.toString());
    }
  }
  //Sign Out
  Future signOut() async{
    try{
      return _auth.signOut();
    }
    catch(error){
      print(error.toString());
      return null;
    }
  }

  Future getUserData() async{
  final User? user = _auth.currentUser;
  final uid = user!.uid;
  print(uid);
  
  dynamic info=await DatabaseManager().getCurrentUserData(uid);
  return info;

  // here you write the codes to input the data into firestore
}
 
}
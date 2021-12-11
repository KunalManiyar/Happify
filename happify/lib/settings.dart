import 'package:flutter/material.dart';
import 'package:happify/signup.dart';
import 'package:provider/provider.dart';
import 'package:happify/Services/AuthenticationServices.dart';
import 'signin.dart';
import 'profile.dart';
class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // This widget is the root of your application.
   final AuthenticationService _auth = AuthenticationService();
  bool _isObscure = true;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  String _profileImgController="" ;
  @override
  void initState() {
    super.initState();
   fetchUserData();
  }
  fetchUserData()async{
    dynamic info=await _auth.getUserData();
    if(info!=null){
      _nameController.text=info[0];
      _emailController.text=info[1];
      _countryController.text=info[2];
      _mobileController.text=info[3].toString();
      _profileImgController=info[4];
      print(_profileImgController);
    }
 
  }
  Widget build(BuildContext context) {

    
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      
      child: MaterialApp(
         debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context),
            ), 
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          body: Container(
            padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          height: 200,
                          width: 200,
                          child:_profileImgController!=""?CircleAvatar(
                      backgroundImage: NetworkImage(_profileImgController), radius: 100.0,
                    ):CircleAvatar(
                      backgroundColor: Colors.orange[600],
                      radius: 100,
                      child:Icon(
                        Icons.person,
                        size: 180.0,
                        color: Colors.white,
                      ),
                    ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            enabled: false,
                            controller: _nameController,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                             
                              contentPadding: EdgeInsets.symmetric(
                                // vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email id',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            enabled: false,
                            controller: _emailController,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              
                              contentPadding: EdgeInsets.symmetric(
                                // vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Country',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            enabled: false,
                            controller: _countryController,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                            
                              contentPadding: EdgeInsets.symmetric(
                                // vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile No',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            enabled: false,
                            controller: _mobileController,
                            onChanged: (value) {
                              //Do something with the user input.
                            },
                            decoration: InputDecoration(
                              
                              contentPadding: EdgeInsets.symmetric(
                                // vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.orange.shade600, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

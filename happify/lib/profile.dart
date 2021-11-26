import 'package:flutter/material.dart';
import 'package:happify/Services/AuthenticationServices.dart';
import 'settings.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends  State<Profile> {
  var details={};
  
  final AuthenticationService _auth = AuthenticationService();
  @override
  bool showText=false;
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    details=arguments;
    if (arguments != null) print("In profile page ${arguments}");
   
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
           leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context),
          ) ,
          automaticallyImplyLeading: true,
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.orange[600],
        ),
        body: Container(
          padding: EdgeInsets.all(36.0),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    height: 200,
                    width: 200,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange[600],
                      radius: 100,
                      child: Icon(
                        Icons.person,
                        size: 180.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 70.0,
                    width: 70.0,
                    margin: EdgeInsets.only(top: 180.0, left: 140.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(
                        Icons.add,
                        size: 60,
                      ),
                      backgroundColor: Colors.orange[600],
                    ),
                  ),
                  
                ],
              ),
               
              Container(
                
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 180.0),
                    child: Column(
                      children: [
                        
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 45.0,
                            width: 300.0,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.orange[600],
                              child: Text(
                                "Done",
                                style: TextStyle(
                                  fontSize: 22.0,
                                ),
                              ),
                              onPressed: () {
                                // arguments['profileImg']="Kunal";
                                // Navigator.pushNamed(
                                // context,
                                // '/settings',
                                // arguments: arguments,
                                // );
                                // setState(()=>showText=!showText);
                                // createUser();
                                Navigator.pushNamed(
                                    context,
                                    '/occasions',
                                    arguments:arguments

                                );

                              },
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}


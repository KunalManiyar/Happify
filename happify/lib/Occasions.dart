import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happify/DatabaseManager/DatabaseManager.dart';
import 'package:happify/Services/AuthenticationServices.dart';

class Occasions extends StatefulWidget {
  @override
  _OccasionsState createState() => _OccasionsState();
}

class _OccasionsState extends State<Occasions> {
  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _occassionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
 

  Map<String,Map<String,String>> eventsList={};
  var ind=0;
  @override
  var details={};
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    details=arguments;
    if (arguments != null) print("In Occasions page ${arguments}");
    return Scaffold(
      
        appBar: AppBar(
          leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context),
          ) ,
          title: Text('Occasions'),
          centerTitle: true,
          backgroundColor: Colors.orange[600],
          automaticallyImplyLeading: false,
          actions: [
            
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                openDialogueBox(context);
              },
            ),
           
          ],
        ),
        body:eventsList.isNotEmpty ?Column(
          children: [
            Expanded(
              child: Container(
                    height: 500,
                    child: ListView.builder(
                      
                      shrinkWrap: true,
                      
                      itemCount: eventsList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(eventsList["$index"]!['event'].toString()),
                            subtitle: Text(eventsList['$index']!['date'].toString()),
                          ),
                        );
                      },
                      ),
                  
                  
                      ),
            ),
                    Align(
                    alignment: Alignment.center,
                    child: SizedBox(
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
                              
                              createUser();
                              Navigator.pushNamed(
                                  context,
                                  '/invites',
                                  // arguments:arguments
                  
                              );
                  
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          )),
                  ),
          ],
        ):Container(
                  child: Center(child: Text("Enter atleast one occassion",style: TextStyle(fontSize: 20),),),
                )
                );
  }

  openDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Event Details'),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  TextField(
                    controller: _occassionController,
                    decoration: InputDecoration(hintText: 'Event'),
                  ),
                  TextField(
                    controller: _dateController,
                    decoration: InputDecoration(hintText: 'Date'),
                  ),
                  
                ],
              ),
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Map<String,String> eventData={};
                  eventData['event']=_occassionController.text;
                  eventData['date']=_dateController.text;
                  setState(() {
                    eventsList['$ind']=eventData;
                  });
                    ind+=1;
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              )
            ],
          );
        });
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
      details['fullName'],
        details['email'], details['password'],details['country'],details['profile'],double.parse(details['mobileNo']),eventsList,false);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      
    }
  }
}
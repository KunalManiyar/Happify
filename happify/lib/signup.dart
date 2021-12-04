import 'package:flutter/material.dart';
import 'package:happify/Services/AuthenticationServices.dart';
import 'package:flutter/services.dart';

import 'profile.dart';
class User{
  final String fullName="";
  final String emailId="";
  final String password="";
  final String confirmPassword="";
  final String countryrReligion="";
  final String mobileNo="";
}
class UserDetails with ChangeNotifier{
  Map _userDetails={};
  Map get userDetails=>_userDetails;
  void setUserDetails(){
    _userDetails=new _SignUpState().details;
    print("In signup page : ${_userDetails}");
    // print("Hello");
    notifyListeners();
  }
}
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // This widget is the root of your application.
  var details = {
  'fullName':'',
  'email':'',
  'password':'',
  'country':'',
  'mobileNo':'',
  
  };
  // String _fullName="",_emailId="",_password="",_confirmPassword="",_countryReligion="",_mobileNo="";
  String _text="";

  bool _isObscure = true;
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  @override
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
          resizeToAvoidBottomInset :false,
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:() => Navigator.pop(context),
          ) ,
            title: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.orange[600],
          ),
          
           body: Container(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Name cannot be empty';
                          } else
                           details['fullName']=_nameController.text;
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                            )),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _emailContoller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else
                          details['email']=_emailContoller.text;
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20)),
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else{
                            details['password']=_passwordController.text;
                            return null;
                          }
                            
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              ),
                            ),
                        style: TextStyle(
                          color: Colors.black,
                          
                        ),
                      ),
                      SizedBox(height: 15),

                      TextFormField(
                        controller: _countryController,
                        
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Country cannot be empty';
                          } else
                          details['country']=_countryController.text;
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Country',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20)),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _mobileController,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        keyboardType: TextInputType.number,
  
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mobile Number cannot be empty';
                          } else
                          details['mobileNo']=_mobileController.text;
                            return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Mobile No',
                            labelStyle: TextStyle(color: Colors.black,fontSize: 20)),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      
                      SizedBox(
                      height: 40.0,
                      width: 300.0,
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.orange[600],
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                                    //  createUser();
                                    // print(details);
                                    Navigator.pushNamed(
                                    context,
                                    '/profile',
                                    arguments: details,
                                );
                            }
                         
                        },
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                      ),
                ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
         ),
       ),
     );
   }

 
 }

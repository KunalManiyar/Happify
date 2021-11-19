import 'package:flutter/material.dart';
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
  var _userDetails={};
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
  'emailId':'',
  'password':'',
  'confirmPassword':'',
  'countryReligion':'',
  'mobileNo':'',
  
  };
  // String _fullName="",_emailId="",_password="",_confirmPassword="",_countryReligion="",_mobileNo="";
  String _text="";
    void _onFullNameChange(String value){
      setState(() => details['fullName']=value);
    }
    void _onEmailChange(String value){
      setState(() => details['emailId']=value);
    }
    void _onPasswordChange(String value){
      setState(() => details['password']=value);
    }
    void _onConfirmPasswordChange(String value){
      setState(() => details['confirmPassword']=value);
    }
    void _onCountryReligionChange(String value){
      setState(() => details['countryReligion']=value);
    }
    void _onMobileNoChange(String value){
      setState(() => details['mobileNo']=value);
    }
  bool _isObscure = true;
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
            padding: EdgeInsets.only(left: 36.0, right: 36.0, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text(
                    _text,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.red
                    ),
                    textAlign: TextAlign.center,
                  ),
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Full Name',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                             
                            onChanged: _onFullNameChange,
                            decoration: InputDecoration(
                              hintText: 'John Doe',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email id',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: _onEmailChange,
                            decoration: InputDecoration(
                              hintText: 'john_doe@gmail.com',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: _isObscure,
                            onChanged: _onPasswordChange,
                            decoration: InputDecoration(
                              hintText: 'xxxxxx',
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
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Confirm Password',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: _isObscure,
                            onChanged: _onConfirmPasswordChange,
                            decoration: InputDecoration(
                              hintText: 'xxxxxx',
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
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Country/Religion',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: _onCountryReligionChange,
                            decoration: InputDecoration(
                              hintText: 'India',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mobile No',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 250,
                          child: TextField(
                            onChanged: _onMobileNoChange,
                            decoration: InputDecoration(
                              hintText: 'john_doe@gmail.com',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
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
                SizedBox(height: 20.0),
                SizedBox(
                  height: 45.0,
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
                      if(details['fullName']==""||details['emailId']==""||details['password']==""||details['confirmPassword']==""||details['countryReligion']==""||details['mobileNo']==""){
                        setState(() =>_text="Please Enter all details");
                      }
                      else{

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
         ),
       ),
     );
   }
 }

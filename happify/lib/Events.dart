import 'package:flutter/material.dart';
import 'package:happify/services/AuthenticationServices.dart';
class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final AuthenticationService _auth = AuthenticationService();
  List userProfileList=[];

  void initState() {
    super.initState();
      fetchUserFriends();
  }
   fetchUserFriends() async{
        dynamic info=await _auth.getUserFriends();
       
        if (info!=null){
            print(info);
            setState(() {
                userProfileList=info;
                
                
            });
              
        }
        print(userProfileList);
          
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Column(
                  children: [
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     'Upcoming',
                    //     style: TextStyle(
                    //       fontSize: 22,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     textAlign: TextAlign.left,
                    //   ),
                    // ),
                    for (int i = 0; i < userProfileList.length; i++)
                      Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 113,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Container(
                                        height: 55,
                                        width: 55,
                                        // child: CircleAvatar(
                                        //   backgroundColor: Colors.orange[600],
                                        //   radius: 50,
                                        //   child: Icon(
                                        //     Icons.person,
                                        //     size: 40.0,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),
                                         child:userProfileList[i]['profile']!=""?CircleAvatar(
                                            backgroundImage: NetworkImage(userProfileList[i]['profile']), radius: 50.0,
                                          ):CircleAvatar(
                                            backgroundColor: Colors.orange[600],
                                            radius: 50,
                                            child:Icon(
                                              Icons.person,
                                              size: 40.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                      ),
                                      Text(
                                        userProfileList[i]['name'],
                                        // 'Name',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text(
                                        userProfileList[i]['events']['0']['event'],
                                        // 'Birthday',
                                        style: TextStyle(fontSize: 25),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 45,
                                  left: 250,
                                  child: Container(
                                    child: Text(
                                      userProfileList[i]['events']['0']['date'],
                                      // '10m',
                                      style: TextStyle(fontSize: 22),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                // SizedBox(
                //   height: 13,
                // ),
                // Column(
                //   children: [
                //     Align(
                //       alignment: Alignment.centerLeft,
                //       child: Text(
                //         'Coming Soon',
                //         style: TextStyle(
                //           fontSize: 22,
                //           fontWeight: FontWeight.bold,
                //         ),
                //         textAlign: TextAlign.left,
                //       ),
                //     ),
                //     for (int i = 0; i < 2; i++)
                //       Column(
                //         children: [
                //           SizedBox(
                //             height: 2,
                //           ),
                //           Container(
                //             height: 113,
                //             width: MediaQuery.of(context).size.width,
                //             decoration: BoxDecoration(
                //               border: Border.all(
                //                 color: Colors.grey,
                //                 width: 2,
                //               ),
                //               borderRadius: BorderRadius.circular(50.0),
                //             ),
                //             child: Stack(
                //               children: [
                //                 Center(
                //                   child: Column(
                //                     mainAxisAlignment:
                //                         MainAxisAlignment.spaceBetween,
                //                     children: [
                //                       SizedBox(
                //                         height: 2,
                //                       ),
                //                       Container(
                //                         height: 55,
                //                         width: 55,
                //                         child: CircleAvatar(
                //                           backgroundColor: Colors.orange[600],
                //                           radius: 50,
                //                           child: Icon(
                //                             Icons.person,
                //                             size: 40.0,
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                       Text(
                //                         'Name',
                //                         style: TextStyle(fontSize: 20),
                //                       ),
                //                       Text(
                //                         'Anniversary',
                //                         style: TextStyle(fontSize: 25),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Positioned(
                //                   top: 45,
                //                   left: 320,
                //                   child: Container(
                //                     child: Text(
                //                       '2d',
                //                       style: TextStyle(fontSize: 22),
                //                     ),
                //                   ),
                //                 )
                //               ],
                //             ),
                //           ),
                //         ],
                //       ),
                //   ],
                // ),
              ],
            ),
          ),
          ),
    );
  }
}

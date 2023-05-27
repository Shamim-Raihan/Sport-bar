import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_bar/screens/chatting_screen.dart';

import '../../auth/login.dart';
import '../../widgets/app_navigation.dart';
import '../../widgets/search_card.dart';
import '../profile_view.dart';
import 'notification_screen.dart';

class BarRooms extends StatefulWidget {
  const BarRooms({super.key});

  @override
  State<BarRooms> createState() => _BarRoomsState();
}

class _BarRoomsState extends State<BarRooms> {
  final auth = FirebaseAuth.instance;
  bool pressed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: PopupMenuButton(
              position: PopupMenuPosition.under,
              color: Color(0xFF2E9E5E),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      shape: Border(
                        bottom: BorderSide(),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        AppNavigation.to(
                          context,
                          ProfileView(),
                        );
                      },
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      shape: Border(
                        bottom: BorderSide(),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        AppNavigation.to(
                          context,
                          NotificationScreen(),
                        );
                      },
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      onTap: () {
                        auth.signOut().then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LoginScreen()),
                          );
                        }).onError((error, stackTrace) {});
                      },
                      leading: Icon(
                        Icons.power_settings_new_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ];
              },
              // icon: Icon(
              //   Icons.menu,
              //   color: Colors.white,
              // ),
            ),
            title: Image(
                height: 45, image: AssetImage('assets/images/splashicon.png')),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "BAR ROOMS",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(children: [
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      padding: EdgeInsets.all(6),
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF2E9E5E)),
                      tabs: [
                        Container(
                          width: 80.0,
                          child: Tab(
                            child: Text(
                              'ACTIVE',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Container(
                            height: 50,
                            width: 94.0,
                            child: Tab(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'PREVIOUSLY',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'VISTED',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ))),
                      ],
                    ),
                    Container(
                      height: 444, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top:
                                  BorderSide(color: Colors.green, width: 0.4))),
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                    onTap: () => AppNavigation.to(
                                        context, ChattingScreen()),
                                    child: Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/bar1.png')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/online.png')),
                                      ],
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                    onTap: () => AppNavigation.to(
                                        context, ChattingScreen()),
                                    child: Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/bar2.png')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/online.png')),
                                      ],
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                    onTap: () => AppNavigation.to(
                                        context, ChattingScreen()),
                                    child: Row(
                                      children: [
                                        Image(
                                            image: AssetImage(
                                                'assets/images/bar3.png')),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Image(
                                            image: AssetImage(
                                                'assets/images/offline.png')),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 10.0,
                                      left: 10,
                                      top: 10,
                                      bottom: 15),
                                  child: SearchCard(),
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Manchester united vs Leeds",
                                          style: TextStyle(letterSpacing: 1),
                                        ),
                                        Text("12/8/2022"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Arsenal vs Fulham 10/8/2022",
                                          style: TextStyle(letterSpacing: 1),
                                        ),
                                        Text("10/8/2022"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Lakers vs Clippers",
                                          style: TextStyle(letterSpacing: 1),
                                        ),
                                        Text("12/6/2022"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Hornets Vs Nets",
                                          style: TextStyle(letterSpacing: 1),
                                        ),
                                        Text("11/4/2022"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Barcelona vs Real Madrid",
                                          style: TextStyle(letterSpacing: 1),
                                        ),
                                        Text("11/4/2022"),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1 of 20"),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(">>"),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),

          // Column(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           "BAR ROOMS",
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(
          //           height: 20,
          //         ),
          //         DefaultTabController(
          //           length: 3, // length of tabs
          //           initialIndex: 0,
          //           child: Column(
          //             children: [
          //               TabBar(
          //                 labelColor: Colors.green,
          //                 isScrollable: true,
          //                 padding: EdgeInsets.all(6),
          //                 indicator: BoxDecoration(
          //                   border: Border.all(color: Colors.green, width: 2),
          //                   borderRadius: BorderRadius.circular(10),
          //                 ),
          //                 unselectedLabelColor: Colors.black,
          //                 tabs: [
          //                   Container(
          //                       width: 80.0, child: Tab(child: Text("ACTIVE"))),
          //                   Container(
          //                       width: 80.0,
          //                       child:
          //                           Tab(child: Text("PREVIOUSLY \n VISITED"))),
          //                 ],
          //               ),
          //               Container(
          //                 height: 400, //height of TabBarView
          //                 decoration: BoxDecoration(
          //                     border: Border(
          //                         top: BorderSide(
          //                             color: Colors.green, width: 0.4))),
          //                 child: TabBarView(children: [
          //                   Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 14),
          //                     child: Column(
          //                       children: [
          //                         GestureDetector(
          //                             onTap: () => AppNavigation.to(
          //                                 context, ChattingScreen()),
          //                             child: Row(
          //                               children: [
          //                                 Image(
          //                                     image: AssetImage(
          //                                         'assets/images/bar1.png')),
          //                                 SizedBox(
          //                                   width: 10,
          //                                 ),
          //                                 Image(
          //                                     image: AssetImage(
          //                                         'assets/images/online.png')),
          //                               ],
          //                             )),
          //                         SizedBox(
          //                           height: 30,
          //                         ),
          //                         GestureDetector(
          //                             onTap: () => AppNavigation.to(
          //                                 context, ChattingScreen()),
          //                             child: Row(
          //                               children: [
          //                                 Image(
          //                                     image: AssetImage(
          //                                         'assets/images/bar1.png')),
          //                                 SizedBox(
          //                                   width: 10,
          //                                 ),
          //                                 Image(
          //                                     image: AssetImage(
          //                                         'assets/images/online.png')),
          //                               ],
          //                             )),
          //                       ],
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 5),
          //                     child: Column(
          //                       children: [
          //                         Padding(
          //                           padding:
          //                               const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //                           child: Column(
          //                             children: [
          //                               SizedBox(
          //                                 height: 10,
          //                               ),
          //                               GestureDetector(
          //                                 child: Card(
          //                                   child: Container(
          //                                     height: 110,
          //                                     width: double.infinity,
          //                                     child: Padding(
          //                                       padding: const EdgeInsets.only(
          //                                           top: 15,
          //                                           left: 15,
          //                                           right: 15),
          //                                       child: Column(
          //                                         children: [
          //                                           Row(
          //                                             children: [
          //                                               Text(
          //                                                 "5 Marla House Construction Quotes",
          //                                                 style: TextStyle(
          //                                                     fontSize: 16,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .w500),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           SizedBox(
          //                                             height: 25,
          //                                           ),
          //                                           Row(
          //                                             mainAxisAlignment:
          //                                                 MainAxisAlignment
          //                                                     .spaceBetween,
          //                                             children: [
          //                                               Container(
          //                                                   decoration:
          //                                                       BoxDecoration(
          //                                                     color: Colors
          //                                                         .lightGreen,
          //                                                     border: Border.all(
          //                                                         width: 1,
          //                                                         style:
          //                                                             BorderStyle
          //                                                                 .solid),
          //                                                     borderRadius:
          //                                                         BorderRadius
          //                                                             .circular(
          //                                                                 10),
          //                                                   ),
          //                                                   child: Padding(
          //                                                     padding:
          //                                                         const EdgeInsets
          //                                                                 .only(
          //                                                             left: 25,
          //                                                             right: 25,
          //                                                             top: 8,
          //                                                             bottom:
          //                                                                 8),
          //                                                     child: Center(
          //                                                         child: Text(
          //                                                       "Active",
          //                                                       style: TextStyle(
          //                                                           fontSize:
          //                                                               15,
          //                                                           color: Colors
          //                                                               .white),
          //                                                     )),
          //                                                   )),
          //                                               Text(
          //                                                 "3 minutes ago",
          //                                                 style: TextStyle(
          //                                                     fontSize: 12),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                   Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 5),
          //                     child: Column(
          //                       children: [
          //                         Padding(
          //                           padding:
          //                               const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //                           child: Column(
          //                             children: [
          //                               SizedBox(
          //                                 height: 10,
          //                               ),
          //                               SizedBox(
          //                                 height: 10,
          //                               ),
          //                               GestureDetector(
          //                                 child: Card(
          //                                   child: Container(
          //                                     height: 110,
          //                                     width: double.infinity,
          //                                     child: Padding(
          //                                       padding: const EdgeInsets.only(
          //                                           top: 15,
          //                                           left: 15,
          //                                           right: 15),
          //                                       child: Column(
          //                                         children: [
          //                                           Row(
          //                                             children: [
          //                                               Text(
          //                                                 "3 Marla House Construction Quotes",
          //                                                 style: TextStyle(
          //                                                     fontSize: 16,
          //                                                     fontWeight:
          //                                                         FontWeight
          //                                                             .w500),
          //                                               ),
          //                                             ],
          //                                           ),
          //                                           SizedBox(
          //                                             height: 25,
          //                                           ),
          //                                           Row(
          //                                             mainAxisAlignment:
          //                                                 MainAxisAlignment
          //                                                     .spaceBetween,
          //                                             children: [
          //                                               Container(
          //                                                   decoration:
          //                                                       BoxDecoration(
          //                                                     color: Color
          //                                                         .fromARGB(
          //                                                             255,
          //                                                             243,
          //                                                             113,
          //                                                             113),
          //                                                     border: Border.all(
          //                                                         width: 1,
          //                                                         style:
          //                                                             BorderStyle
          //                                                                 .solid),
          //                                                     borderRadius:
          //                                                         BorderRadius
          //                                                             .circular(
          //                                                                 10),
          //                                                   ),
          //                                                   child: Padding(
          //                                                     padding:
          //                                                         const EdgeInsets
          //                                                                 .only(
          //                                                             left: 20,
          //                                                             right: 20,
          //                                                             top: 8,
          //                                                             bottom:
          //                                                                 8),
          //                                                     child: Center(
          //                                                         child: Text(
          //                                                       "Inactive",
          //                                                       style: TextStyle(
          //                                                           fontSize:
          //                                                               15,
          //                                                           color: Colors
          //                                                               .white),
          //                                                     )),
          //                                                   )),
          //                                               Text(
          //                                                 "20 minutes ago",
          //                                               ),
          //                                             ],
          //                                           ),
          //                                         ],
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ]),
          //               )
          //             ],
          //           ),
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../auth/login.dart';
import '../../widgets/app_navigation.dart';
import '../profile_view.dart';
import 'notification_screen.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  final auth = FirebaseAuth.instance;

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
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SPORTS NEWSFEED",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ReadMoreText(
                      'sghzdjdkyflfluiiiiiiiifhlllllllllllllllllgc ytckuflig;oig;oih;oih;oih ukfligog;oih;oih;oih;ih;ih;pi ukkutdtsyrdkyliflg;ouh;hh;ihh/ kv.bjkb.kv,jjgckgjcjgh. sghzdjdkyflfluiiiiiiiifhlllllllllllllllllgc ytckuflig;oig;oih;oih;oih ukfligog;oih;oih;oih;ih;ih;pi ukkutdtsyrdkyliflg;ouh;hh;ihh/ kv.bjkb.kv,jjgckgjcjgh.lkglixj',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: ' Read less',
                      moreStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      lessStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ReadMoreText(
                      'sghzdjdkyflfluiiiiiiiifhlllllllllllllllllgc ytckuflig;oig;oih;oih;oih ukfligog;oih;oih;oih;ih;ih;pi ukkutdtsyrdkyliflg;ouh;hh;ihh/ kv.bjkb.kv,jjgckgjcjgh. sghzdjdkyflfluiiiiiiiifhlllllllllllllllllgc ytckuflig;oig;oih;oih;oih ukfligog;oih;oih;oih;ih;ih;pi ukkutdtsyrdkyliflg;ouh;hh;ihh/ kv.bjkb.kv,jjgckgjcjgh.lkglixj',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      trimExpandedText: ' Read less',
                      moreStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      lessStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}

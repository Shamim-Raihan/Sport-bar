import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import '../../auth/login.dart';
import '../../firebase_services/local_notifications.dart';
import '../../widgets/app_navigation.dart';
import '../profile_view.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String notificationMsg = "No notifications yet!";
  String notificationMsg2 = "";
  @override
  void initState() {
    super.initState();

    LocalNotificationService.initilize();

    // Terminated State
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          notificationMsg = "${event.notification!.title}";
        });
        setState(() {
          notificationMsg2 = "${event.notification!.body}";
        });
      }
    });

    // Foregrand State
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotificationService.showNotificationOnForeground(event);
      setState(() {
        notificationMsg = "${event.notification!.title}";
      });
      setState(() {
        notificationMsg2 = "${event.notification!.body}";
      });
    });

    // background State
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg = "${event.notification!.title}}";
      });
      setState(() {
        notificationMsg2 = "${event.notification!.body}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Image(
                height: 45, image: AssetImage('assets/images/splashicon.png')),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 8, left: 8),
                  child: Text(
                    notificationMsg,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 10),
                  child: Text(
                    notificationMsg2,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        )));
  }
}

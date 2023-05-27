import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../firebase_services/local_notifications.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  String notificationMsg = "No new notifications.";
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF2E9E5E),

        body: CustomScrollView(slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: Container(
                    width: 346,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: new EdgeInsets.only(right: 13.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, right: 8, left: 8),
                          child: Text(
                            notificationMsg,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 8, right: 8, left: 10),
                          child: Text(
                            notificationMsg2,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 100, bottom: 14),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF2E9E5E)),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Click here to visit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),

        // Column(
        //   children: [
        //     Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           height: 250,
        //           width: 400,
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(10),
        //           ),
        //           child: ListView(children: [
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Text(
        //                 notificationMsg,
        //                 style: TextStyle(
        //                     fontSize: 20, fontWeight: FontWeight.w600),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Text(
        //                 notificationMsg2,
        //                 style: TextStyle(
        //                     fontSize: 16, fontWeight: FontWeight.w400),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 30,
        //             ),
        //             Padding(
        //               padding:
        //                   const EdgeInsets.only(top: 10, left: 12, bottom: 10),
        //               child: Text(
        //                 'Available in-stores and online.',
        //                 style: TextStyle(
        //                     fontSize: 16, fontWeight: FontWeight.w400),
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 10, right: 100),
        //               child: ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'Click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ),
        //           ]),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // ListView(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 150,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Sale on Unstiched !',
        //                     style: TextStyle(
        //                         fontSize: 20, fontWeight: FontWeight.w600),
        //                   ),
        //                   Text(
        //                     '29 Jul at 12:31',
        //                     style: TextStyle(fontSize: 10, color: Colors.grey),
        //                   ),
        //                 ],
        //               ),
        //               Text('All your favourite unstiched on Sale!'),
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text('Available in-stores and online.'),
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Rang Kahani',
        //                     style: TextStyle(
        //                         fontSize: 20, fontWeight: FontWeight.w600),
        //                   ),
        //                   Text(
        //                     '4 Jun at 12:32',
        //                     style: TextStyle(fontSize: 10, color: Colors.grey),
        //                   ),
        //                 ],
        //               ),
        //               Text(
        //                   'A collection that incorporates versatile hues, itricate embroideries and artistic prints. Get ready to flaunt in color this season with Bonanza Satrangi.'),
        //               Text('Unstitched 3 piece Starting from Rs. 3,680'),
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text('Available in-stores and online.'),
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 260,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Summer\'22 Weekly New',
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.w600),
        //                       ),
        //                       Text(
        //                         'Arrivals',
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.w600),
        //                       ),
        //                     ],
        //                   ),
        //                   Text(
        //                     '20 May at 12:17',
        //                     style: TextStyle(fontSize: 10, color: Colors.grey),
        //                   ),
        //                 ],
        //               ),
        //               Text(
        //                   'This Summer\'22 Weekly New Arrivals combine craftsmanship of sumptuous fabrics and beautiful embellishments. Shop now to build a wardrobe that compliments you and makes you feel alive.'),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               Text('Unstitched 3 Piece Starting from PKR. 2,380'),
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text('Available in-stores and online.'),
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 240,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Chamak Dhamak - Festive',
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.w600),
        //                       ),
        //                       Text(
        //                         'Collection',
        //                         style: TextStyle(
        //                             fontSize: 20, fontWeight: FontWeight.w600),
        //                       ),
        //                     ],
        //                   ),
        //                   Text(
        //                     '5 Apr at 14:18',
        //                     style: TextStyle(fontSize: 10, color: Colors.grey),
        //                   ),
        //                 ],
        //               ),
        //               Text(
        //                   'Bonanza Satrangi presets Chamak Dhamak, an intricately curated festive collection. This collection is richly layered with beautiful embroidery and delicately designed foil printed dupattas making it a visionary feast Unstitched - 3 Piece Rs. 5,980'),
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text('Available in-stores and online.'),
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Container(
        //         height: 200,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.start,
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     'Summer\'22 Prints of Eid',
        //                     style: TextStyle(
        //                         fontSize: 20, fontWeight: FontWeight.w600),
        //                   ),
        //                   Text(
        //                     '31 Mar at 13:31',
        //                     style: TextStyle(fontSize: 10, color: Colors.grey),
        //                   ),
        //                 ],
        //               ),
        //               Text(
        //                   'Bonanza Satrangi presets you with gorgeous prints for this summer and Eid season. The Summer\'22 Prints of Eid is a uniquely crafted collection. Unstitched 3 piece starting from PKR. 2,380'),
        //               SizedBox(
        //                 height: 25,
        //               ),
        //               Text('Available in-stores and online.'),
        //               ElevatedButton(
        //                 style: ButtonStyle(
        //                   backgroundColor:
        //                       MaterialStateProperty.all(Colors.black),
        //                 ),
        //                 onPressed: _launchUrl,
        //                 child: Text(
        //                   'click here to visit',
        //                   style: TextStyle(color: Colors.white),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

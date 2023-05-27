import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:sports_bar/screens/profile_view.dart';
import 'package:sports_bar/screens/scores_screen.dart';

import '../auth/login.dart';
import '../widgets/app_navigation.dart';
import 'bottomNav_screens/notification_screen.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  final auth = FirebaseAuth.instance;
  final List<String> imageList = [
    "assets/images/banner.png",
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey[100],
        bottomNavigationBar: BottomAppBar(
            color: Colors.blueGrey[50],
            elevation: 6,
            // BottomAppBar content
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
              child: Container(
                padding: EdgeInsets.only(right: 10),
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1.8,
                    color: Colors.grey,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/images/smile.png'),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Message",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            iconSize: 25.0,
                            color: Color(0xFF565454),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.attach_file),
                            iconSize: 25.0,
                            color: Color(0xFF565454),
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Image(
                            image: AssetImage('assets/images/donate.png'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
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
                              builder: (BuildContext context) => LoginScreen()),
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
        body: Column(
          children: [
            GestureDetector(
              onTap: () => AppNavigation.to(context, ScoresScreen()),
              child: Container(
                height: 60,
                color: Colors.black,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  items: imageList
                      .map(
                        (item) => Container(
                          child: Center(
                            child: Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: 1000,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 160,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            height: 40,
                                            image: AssetImage(
                                                'assets/images/person.png')),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Carlos @Carlosie"),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 50,
                                      ),
                                      child: Text(
                                        "Whoa.....Let’s go United!!\n .........(Active Sample)......",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.thumb_up,
                                              color: isLiked
                                                  ? Color(0xFF2EB744)
                                                  : Color(0xFF736363),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 30,
                                          likeBuilder: (bool isLiked) {
                                            return Image(
                                              image: isLiked
                                                  ? AssetImage(
                                                      'assets/images/binred.png')
                                                  : AssetImage(
                                                      'assets/images/bin.png'),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.star,
                                              color: isLiked
                                                  ? Colors.blue
                                                  : Color(0xFF736363),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 160,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xFF87DEAC),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            height: 40,
                                            image: AssetImage(
                                                'assets/images/person2.png')),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("DannyB @DannyCEO"),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                      ),
                                      child: Text(
                                        "Why is Ronaldo not in \n the line up?",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.thumb_up,
                                              color: isLiked
                                                  ? Color(0xFF2EB744)
                                                  : Color(0xFF736363),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 30,
                                          likeBuilder: (bool isLiked) {
                                            return Image(
                                              image: isLiked
                                                  ? AssetImage(
                                                      'assets/images/binred.png')
                                                  : AssetImage(
                                                      'assets/images/bin.png'),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.star,
                                              color: isLiked
                                                  ? Colors.blue
                                                  : Color(0xFF736363),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 160,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            height: 40,
                                            image: AssetImage(
                                                'assets/images/person3.png')),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Piro @piotii"),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 60,
                                      ),
                                      child: Text(
                                        "Jokers!! Chelsea is surely winning this one",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.thumb_up,
                                              color: isLiked
                                                  ? Color(0xFF2EB744)
                                                  : Color(0xFF736363),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 30,
                                          likeBuilder: (bool isLiked) {
                                            return Image(
                                              image: isLiked
                                                  ? AssetImage(
                                                      'assets/images/binred.png')
                                                  : AssetImage(
                                                      'assets/images/bin.png'),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.star,
                                              color: isLiked
                                                  ? Colors.blue
                                                  : Color(0xFF736363),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 80,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE0E0E0),
                                  borderRadius: BorderRadius.circular(0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Piro @piotii",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Image(
                                              height: 25,
                                              image: AssetImage(
                                                  'assets/images/person3.png')),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text(
                                              "Jokers!! Chelsea is surely\nwinning this one",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 160,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Color(0xFF87DEAC),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                            height: 40,
                                            image: AssetImage(
                                                'assets/images/person2.png')),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "DannyB @DannyCEO",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 25,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "@piotil you are a",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Image(
                                              image: AssetImage(
                                                  'assets/images/emoji.png'))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.thumb_up,
                                              color: isLiked
                                                  ? Color(0xFF2EB744)
                                                  : Color(0xFF736363),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 30,
                                          likeBuilder: (bool isLiked) {
                                            return Image(
                                              image: isLiked
                                                  ? AssetImage(
                                                      'assets/images/binred.png')
                                                  : AssetImage(
                                                      'assets/images/bin.png'),
                                            );
                                          },
                                          likeCount: 0,
                                        ),
                                        LikeButton(
                                          size: 50,
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              Icons.star,
                                              color: isLiked
                                                  ? Colors.blue
                                                  : Color(0xFF736363),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

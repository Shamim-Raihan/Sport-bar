import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_bar/screens/bottomNav_screens/bar_rooms.dart';
import 'package:sports_bar/screens/bottomNav_screens/news_screen.dart';
import 'package:sports_bar/screens/bottomNav_screens/notification_screen.dart';
import 'package:sports_bar/screens/home_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    HomeScreen(),
    BarRooms(),
    MessageScreen(),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      selectedItemColor: Color(0xFF2E9E5E),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      currentIndex: index,
      onTap: (index) {
        setState(() {
          this.index = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            width: 28,
            height: 28,
            color: index == 0 ? Color(0xFF2E9E5E) : Colors.grey,
          ),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/door.svg',
            width: 20,
            height: 20,
            color: index == 1 ? Color(0xFF2E9E5E) : Colors.grey,
          ),
          label: "channel",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/news.svg',
            width: 20,
            height: 20,
            color: index == 2 ? Color(0xFF2E9E5E) : Colors.grey,
          ),
          label: "message",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/bell.svg',
            width: 20,
            height: 20,
            color: index == 3 ? Color(0xFF2E9E5E) : Colors.grey,
          ),
          label: "notification",
        ),
      ],
    );
  }
}

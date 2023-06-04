import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../auth/login.dart';
import '../../controllers/tournament_controller.dart';
import '../../widgets/app_navigation.dart';
import '../profile_view.dart';
import 'notification_screen.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final auth = FirebaseAuth.instance;

  final TournamentController _tournamentController =
  Get.put(TournamentController());

  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  String link="https://www.youtube.com/watch?v=YMx8Bbev6T4&ab_channel=FlutterUIDev";

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: link,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TournamentController>(builder: (tournamentcontroller)
    {
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
                      height: 45,
                      image: AssetImage('assets/images/splashicon.png')),
                  centerTitle: true,
                ),
                body: tournamentcontroller.dataloading.value ?
                Center(child: CircularProgressIndicator()) : Center(
                  child: Obx(()
                    => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 70,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount:
                              _tournamentController.allcatlist!.data!
                                  .uniqueTournaments!.length,
                              itemBuilder: (context, index) {
                                var result = _tournamentController.allcatlist!
                                    .data!.uniqueTournaments;
                                return Column(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 40, width: 100,
                                          child: ElevatedButton(onPressed: () {
                                            tournamentcontroller.fetchNews(
                                                result![index].id.toString()
                                            );
                                          },
                                            child: Container(
                                              //height: 50,width: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(14),
                                                  color: Color(0xFF2E9E5E)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    4.0),
                                                child: Center(child: Text(
                                                  "${result![index].name}",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 2,)),
                                              ),
                                            ),),
                                        )
                                    ),
                                    SizedBox(height: 10,)
                                  ],
                                );
                              }),
                        ),
                        _tournamentController.dataloading2.value ?
                            _tournamentController.news==null?
                                Center(child: Text("No News Found ")):
                        Center(child: CircularProgressIndicator()) :
                        SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: 570,
                          child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount:_tournamentController.news!.data!.length!,
                              itemBuilder: (context, index) {
                                var result = _tournamentController.news!.data!;
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 320, width: 400,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                14),
                                            color: Color(0xFF2E9E5E)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(child: Column(
                                            children: [
                                              Text(
                                                "${result![index].title}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                  fontSize: 25
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,),
                                              SizedBox(height: 10,),

                                              // YoutubePlayer(
                                              //   controller: _controller,
                                              //   showVideoProgressIndicator: true,
                                              // ),
                                              Container(
                                                height:200,width:400,
                                                decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                                ),
                                                  child: ClipRRect(

                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network("${result![index].thumbnailUrl}",height: 200,width: 400,fit: BoxFit.fill,))),
                                              Padding(
                                                padding: const EdgeInsets.all(0.0),
                                                child: Row(
                                                  mainAxisAlignment : MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("${
                                                    _tournamentController.readTimestamp(
                                                      result![index].createdAtTimestamp!
                                                    )
                                                    }",style: TextStyle(color: Colors.white),),
                                                    GestureDetector(
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                              height:30,width:60,
                                                              decoration:BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10)
                                                              ),
                                                              child: ClipRRect(

                                                                  borderRadius: BorderRadius.circular(10),
                                                                  child: Image.network("${result![index].thumbnailUrl}",height: 30,width: 60,fit: BoxFit.fill,))),
                                                          Positioned(
                                                            top: 4,
                                                              left: 17,
                                                              child: Icon(Icons.play_arrow,color: Colors.white,))
                                                        ],
                                                      ),
                                                      onTap: (){
                                                        link=result![index].sourceUrl.toString();
                                                        showDialog<void>(
                                                            context: context,
                                                            builder: (BuildContext context) {
                                                              return
                                                                AlertDialog(
                                                                  contentPadding: const EdgeInsets.only(top: 15),
                                                                  insetPadding: const EdgeInsets.symmetric(horizontal: 15),
                                                                  title:  Center(child: Text('${result![index]!.title.toString()}')),
                                                                  content: SizedBox(
                                                                    height: 200.h,                                                                    width: MediaQuery.of(context).size.width,
                                                                    child: YoutubePlayer(
                                                                      controller: _controller,
                                                                    ),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: const Text('Close'),
                                                                      onPressed: () => Navigator.of(context).pop(),
                                                                    ),
                                                                  ],
                                                                  actionsPadding: const EdgeInsets.all(0),
                                                                );});
                                                      },
                                                    ),
                                                    IconButton(onPressed: () async{
                                                      String url = '${result![index].sourceUrl.toString()}';
                                                      if(await canLaunch(url)){
                                                      await launch(url);  //forceWebView is true now
                                                      }else {
                                                      throw 'Could not launch $url';
                                                      }
                                                    }, icon: Icon(Icons.ondemand_video_outlined,color: Colors.white,))
                                                 ],
                                                ),
                                              ),
                                              Text("${DateTime.fromMillisecondsSinceEpoch(
                                                  (result![index].createdAtTimestamp)!*1000).toString().substring(0,11)}",style: TextStyle(color: Colors.white),)
                                            ],
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,)
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              )));
    });
  }
}

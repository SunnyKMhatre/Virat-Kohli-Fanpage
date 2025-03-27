import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/common_widget/authentication.dart';
import 'package:vk_fanpage/controller/family_controller.dart';
import 'package:vk_fanpage/controller/news_controller.dart';
import 'package:vk_fanpage/controller/quotes_controller.dart';
import 'package:vk_fanpage/controller/rcbimages_controller.dart';
import 'package:vk_fanpage/controller/singlenews_controller.dart';
import 'package:vk_fanpage/controller/slogan_controller.dart';
import 'package:vk_fanpage/controller/videos_controller.dart';
import 'package:vk_fanpage/controller/wallpaper_controller.dart';
import 'package:vk_fanpage/model/basemodal.dart';
import 'package:vk_fanpage/view/detailnews.dart';
import 'package:vk_fanpage/view/family_home.dart';
import 'package:vk_fanpage/view/images.dart';
import 'package:vk_fanpage/view/login.dart';
import 'package:vk_fanpage/view/quotes.dart';
import 'package:vk_fanpage/view/slogan.dart';
import 'package:vk_fanpage/view/videos.dart';
import 'package:vk_fanpage/view/wallpaper_home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? userEmail = "";

  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  void getUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      userEmail = user?.email ?? "User";
    });
  }

  List<Basemodal> oflist = [
    Basemodal(image: "assets/wallpapercollage.jpg", text: "Wallpapers"),
    Basemodal(image: "assets/familycollage.jpg", text: "Family"),
    Basemodal(image: "assets/rcbcollage.jpg", text: "Images"),
    Basemodal(image: "assets/videoscollage.jpg", text: "Videos"),
    Basemodal(image: "assets/quotescollage.jpg", text: "Quotes"),
    Basemodal(image: "assets/slogancollage.jpg", text: "Slogan"),
  ];

  List<Basemodal> matches = [
    Basemodal(image: "Test 1 of 5", text: "20-24 Jun"),
    Basemodal(image: "Test 2 of 5", text: "2-6 Jul"),
    Basemodal(image: "Test 3 of 5", text: "10-14 Jul"),
    Basemodal(image: "Test 4 of 5", text: "23-27 Jul"),
    Basemodal(image: "Test 5 of 5", text: "31 Jul-4 Aug"),
  ];
  @override
  Widget build(BuildContext context) {
    final controller1 = context.read<FamilyController>();
    final controller2 = context.read<WallpaperController>();
    final controller3 = context.watch<NewsController>();
    final controller4 = context.read<RcbimagesController>();
    final controller5 = context.read<VideosController>();
    final controller6 = context.read<SloganController>();
    final controller7 = context.read<QuotesController>();
    final controller8 = context.read<SinglenewsController>();
    return Scaffold(
        drawer: Drawer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, const Color.fromARGB(255, 148, 26, 17)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.grey,
                ),
                Text(
                  "User ID",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mail_outline,
                      color: Colors.grey,
                    ),
                    Text(
                      "$userEmail",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () async {
                    await AuthServices().signOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/homebgimage.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Builder(
                              builder: (context) => IconButton(
                                icon: Icon(Icons.menu,
                                    color: Colors.white, size: 30),
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Image.asset(
                              "assets/icon.png",
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              "The",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Virat ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: 'Kohli',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...oflist.map((e) => GestureDetector(
                            onTap: () {
                              if (e.text == "Wallpapers") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WallpaperHome()));
                                controller2.wallpaperdata();
                              } else if (e.text == "Family") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Family_Home()));
                                controller1.familydata();
                              } else if (e.text == "Images") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Images()));
                                controller4.rcbimagesdata();
                              } else if (e.text == "Videos") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Videos()));
                                controller5.videosdata();
                              } else if (e.text == "Quotes") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Quotes()));
                                controller7.quotesdata();
                              } else if (e.text == "Slogan") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Slogan()));
                                controller6.slogandata();
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 125,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        e.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 125,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey),
                                    child: Center(
                                      child: Text(
                                        e.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Top Stories",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: controller3.responce == null
                        ? Center(child: CircularProgressIndicator())
                        : Row(
                            children: List.generate(
                                controller3.responce!.length, (i) {
                              final reversedIndex =
                                  controller3.responce!.length - 1 - i;
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Detailnews(
                                          newsTitle: controller3
                                              .responce![reversedIndex]
                                              .newsTitle,
                                          newsImage: controller3
                                              .responce![reversedIndex]
                                              .newsImage,
                                        ),
                                      ),
                                    );
                                    controller8.singlenewsdata();
                                  },
                                  child: Container(
                                    height: 185,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 130,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Image.network(
                                              controller3
                                                      .responce![reversedIndex]
                                                      .newsImage ??
                                                  "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Container(
                                            height: 55,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3),
                                                child: Text(
                                                  controller3
                                                          .responce![
                                                              reversedIndex]
                                                          .newsTitle ??
                                                      "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Upcoming Matches",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...matches.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                                height: 160,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(80),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(e.image,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Image.asset("assets/england_flag.png",
                                              width: 50, height: 30),
                                          Text("Vs"),
                                          Image.asset("assets/india_flag.jpg",
                                              width: 50, height: 30),
                                          Text(e.text,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text("Start at 3:30 pm",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}

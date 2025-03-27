import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/controller/family_controller.dart';
import 'package:vk_fanpage/controller/news_controller.dart';
import 'package:vk_fanpage/controller/quotes_controller.dart';
import 'package:vk_fanpage/controller/rcbimages_controller.dart';
import 'package:vk_fanpage/controller/singlenews_controller.dart';
import 'package:vk_fanpage/controller/slogan_controller.dart';
import 'package:vk_fanpage/controller/videos_controller.dart';
import 'package:vk_fanpage/controller/wallpaper_controller.dart';
import 'package:vk_fanpage/view/home.dart';
import 'package:vk_fanpage/view/screen1.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //check packges are properly installed or not

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FamilyController()),
        ChangeNotifierProvider(create: (context) => WallpaperController()),
        ChangeNotifierProvider(create: (context) => NewsController()),
        ChangeNotifierProvider(create: (context) => RcbimagesController()),
        ChangeNotifierProvider(create: (context) => VideosController()),
        ChangeNotifierProvider(create: (context) => SloganController()),
        ChangeNotifierProvider(create: (context) => QuotesController()),
        ChangeNotifierProvider(create: (context) => SinglenewsController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return Splash();
              }
            }),
        builder: EasyLoading.init(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Screen1()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "assets/Splash.jpeg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

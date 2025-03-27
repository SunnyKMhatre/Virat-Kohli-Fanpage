import 'package:flutter/material.dart';
import 'package:vk_fanpage/view/login.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/BackgroundImage.jpg",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 100,
              left: 20,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/U19Image.jpeg'),
                ),
              )),
          Positioned(
              top: 200,
              right: 20,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/wc2011Image.jpeg'),
                ),
              )),
          Positioned(
              top: 300,
              left: 20,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage('assets/bgtImage.jpeg'),
                ),
              )),
          Positioned(
            top: 400,
            right: 20,
            child: CircleAvatar(
              radius: 85,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/OrangecapImage.jpeg'),
              ),
            ),
          ),
          Positioned(
            top: 500,
            left: 20,
            child: CircleAvatar(
              radius: 85,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/T20Image.jpeg'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("Continue",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

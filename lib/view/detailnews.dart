import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/controller/singlenews_controller.dart';

class Detailnews extends StatelessWidget {
  final String? newsTitle;
  final String? newsImage;

  const Detailnews({Key? key, this.newsTitle, this.newsImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SinglenewsController>();
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black, const Color.fromARGB(255, 172, 37, 27)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        size: 24, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text("Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsTitle ?? "No Title",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network(newsImage ?? "", fit: BoxFit.cover),
                  SizedBox(
                    height: 10,
                  ),
                  controller.response == null
                      ? Center(
                          child: SingleChildScrollView(),
                        )
                      : Text(
                          "${controller.response!.newsDesc}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/controller/wallpaper_controller.dart';

class WallpaperHome extends StatelessWidget {
  const WallpaperHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WallpaperController>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, const Color.fromARGB(255, 148, 26, 17)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Text("Wallpapers",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 5)),
            Expanded(
              child: controller.response == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(10),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: controller.response!.length,
                      itemBuilder: (context, i) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white, width: 4), // White border
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                          child: Image.network(
                            controller.response![i].image ?? "",
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

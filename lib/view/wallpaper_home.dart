import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
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
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenImage(
                                  imageUrl: controller.response![i].image ?? ""),
                            ),
                          ),
                          child: Container(
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
                        ));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;
  const FullScreenImage({super.key, required this.imageUrl});

  void _downloadImage(BuildContext context) async {
    try {
      var imageId = await ImageDownloader.downloadImage(imageUrl);
      if (imageId == null) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image saved to gallery")),
      );
    } catch (error) {
      print("Error downloading image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InteractiveViewer(
                child: Image.network(imageUrl, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () => _downloadImage(context),
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text("Download", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
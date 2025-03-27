import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_fanpage/controller/videos_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VideosController>();
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
            Text("Videos",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 5)),
            Expanded(
              child: controller.responce == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: controller.responce!.length,
                      itemBuilder: (context, i) {
                        

                        return Card(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side:
                                const BorderSide(color: Colors.white, width: 2),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    controller.responce![i].image ?? "",
                                    height: 200,
                                    width: 500,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                Container(
                                  width: 500,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    controller.responce![i].title ?? "No Title",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                if (controller.responce![i].url != null && controller.responce![i].url!.isNotEmpty)
                                  SizedBox(
                                    height: 200,
                                    child: WebViewWidget(
                                      controller: WebViewController()
                                        ..setJavaScriptMode(
                                            JavaScriptMode.unrestricted)
                                        ..loadRequest(Uri.parse(controller.responce![i].url!)),
                                    ),
                                  )
                                else
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      "No Video Available",
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                  ),
                              ],
                            ),
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

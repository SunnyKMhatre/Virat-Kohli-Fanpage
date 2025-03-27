import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vk_fanpage/model/videos_modal.dart';
import 'package:http/http.dart' as http;

class VideosController extends ChangeNotifier {
  List<VideosModal>? responce;

  void videosdata() async {
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/videos_list"));
      if (api.statusCode == 200) {
        responce = VideosModal.ofvideosmodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

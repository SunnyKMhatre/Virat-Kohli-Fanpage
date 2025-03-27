import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vk_fanpage/model/wallpaper_modal.dart';
import 'package:http/http.dart' as http;

class WallpaperController extends ChangeNotifier {
  List<WallpaperModal>? response;

  void wallpaperdata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/wallpapers_list"));
      if (api.statusCode == 200) {
        response = WallpaperModal.ofwallpapermodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("API Fetch Failed");
      }
    } catch (e) {
      print(e.toString());
    }
    EasyLoading.dismiss();
  }
}

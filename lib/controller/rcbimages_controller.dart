import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vk_fanpage/model/rcbimages_modal.dart';
import 'package:http/http.dart' as http;

class RcbimagesController extends ChangeNotifier {
  List<RcbImagesModal>? responce;

  void rcbimagesdata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/rcb_images_list_no_page"));

      if (api.statusCode == 200) {
        responce = RcbImagesModal.ofrcbimages(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("NO API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
    EasyLoading.dismiss();
  }
}

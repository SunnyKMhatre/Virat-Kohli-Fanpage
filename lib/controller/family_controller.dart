import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:vk_fanpage/model/family_modal.dart';

class FamilyController extends ChangeNotifier {
  List<FamilyModal>? responce;

  void familydata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/family_list"));
      if (api.statusCode == 200) {
        responce = FamilyModal.offamilymodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
    EasyLoading.dismiss();
  }
}

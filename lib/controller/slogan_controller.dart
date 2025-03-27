import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vk_fanpage/model/slogan_modal.dart';
import 'package:http/http.dart' as http;

class SloganController extends ChangeNotifier {
  List<SloganModal>? response;

  void slogandata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/slogans_list_no_page"));
      if (api.statusCode == 200) {
        response = SloganModal.ofsloganmodal(jsonDecode(api.body));
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

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vk_fanpage/model/singlenews_modal.dart';
import 'package:http/http.dart' as http;

class SinglenewsController extends ChangeNotifier {
  SingleNewsModal? response;

  void singlenewsdata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_single_news?news_id=1"));
      if (api.statusCode == 200) {
        response = SingleNewsModal.fromJson(jsonDecode(api.body));
        notifyListeners();
      } else {}
    } catch (e) {
      print(e.toString());
    }
    EasyLoading.dismiss();
  }
}

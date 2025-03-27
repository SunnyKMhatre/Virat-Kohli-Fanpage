import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vk_fanpage/model/news_modal.dart';
import 'package:http/http.dart' as http;

class NewsController extends ChangeNotifier {
  List<NewsModal>? responce;

  NewsController() {
    newsdata();
  }
  void newsdata() async {
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/virat_kohli_news_list"));

      if (api.statusCode == 200) {
        responce = NewsModal.ofnewsmodal(jsonDecode(api.body));
        notifyListeners();
      } else {
        print("No API Fetch");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

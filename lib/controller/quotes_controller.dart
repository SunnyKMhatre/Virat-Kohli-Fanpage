import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vk_fanpage/model/quotes.dart';
import 'package:http/http.dart' as http;

class QuotesController extends ChangeNotifier {
  List<QuotesModal>? response;

  void quotesdata() async {
    EasyLoading.show(status: "Loading");
    try {
      var api = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/virat_kohli/quotes_list"));
      if (api.statusCode == 200) {
        response = QuotesModal.ofquotesmodal(jsonDecode(api.body));
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

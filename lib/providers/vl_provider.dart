import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class VlProvider extends ChangeNotifier {
  static const _pathQuotaHf = 'stokapi/rekapstock/kuotafaskes/';
  String apiHost = dotenv.get('API_HOST', fallback: '');

  Future getQuotaHf(filter) async {
    Uri uri = Uri.https(apiHost, '$_pathQuotaHf$filter');

    var result = await http.get(uri);

    if (result.statusCode == 200) {
      Map data = jsonDecode(result.body);
      Map quota = data['response'];
      return quota;
    }
  }
}

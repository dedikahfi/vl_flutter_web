import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:vl/models/healthfacilities.dart';
import 'package:vl/models/province.dart';

import '../models/district.dart';

class MasterProvider extends ChangeNotifier {
  static const _pathProvince = 'stokapi/masterdata/propinsi/';
  static const _pathDistrict = 'stokapi/masterdata/kabupaten/';
  static const _pathHealthFacilities = 'stokapi/masterdata/fasyankes/';
  String apiHost = dotenv.get('API_HOST', fallback: '');

  Future<List<Province>> getProvince() async {
    Uri uri = Uri.https(apiHost, _pathProvince);
    var result = await http.get(uri);
    Map data = jsonDecode(result.body);
    List<Province> provinces = Province.fromJsonList(data['response']);
    return provinces;
  }

  Future<List<District>> getDistrict(filter) async {
    Uri uri = Uri.https(apiHost, '$_pathDistrict$filter');
    var result = await http.get(uri);
    Map data = jsonDecode(result.body);
    List<District> district = District.fromJsonList(data['response']);
    return district;
  }

  Future<List<HealthFacilities>> getHealthFacilities(filter) async {
    Uri uri = Uri.https(apiHost, '$_pathHealthFacilities$filter');
    var result = await http.get(uri);
    Map data = jsonDecode(result.body);
    List<HealthFacilities> hf = HealthFacilities.fromJsonList(data['response']);
    return hf;
  }
}

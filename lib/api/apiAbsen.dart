// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pancakan/model/mAbsen.dart';

class ApiAbsen {
  static String host = 'http://192.168.43.198/api-sipa/public';

  Future<List<Absen>> getAbsen() async {
    Uri urlApi = Uri.parse('$host/api/Absen');
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => Absen.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
  // Future<List<Absen>?> getAbsen() async {
  //   Uri urlApi = Uri.parse('$host/api/Absen');
  //   final response = await http.get(urlApi);
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return absenFromJson(json);
  //   }
  // }
}

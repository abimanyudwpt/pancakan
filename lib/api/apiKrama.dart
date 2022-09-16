// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, file_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pancakan/model/mKrama.dart';

class ApiKrama {
  static String host = 'http://192.168.1.10/api-sipa/public';

  Future<List<DataKrama>> getKrama() async {
    Uri urlApi = Uri.parse('$host/api/Absensi');
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => DataKrama.fromJson(e))).toList();
    } else {
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }
  }
}

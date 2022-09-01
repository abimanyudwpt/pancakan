// ignore_for_file: file_names, body_might_complete_normally_nullable

import 'package:pancakan/model/m_tester.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<Post>?> getPost() async {
    var client = http.Client();

    var uri = Uri.parse('https://62dd2d3f57ac3c3f3c65af84.mockapi.io/jadwal');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}

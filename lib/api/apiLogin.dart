// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, file_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pancakan/model/message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiLogin {
  static String host = 'http://192.168.1.10/api-sipa/public';

  static Future<Message> signIn(_post) async {
    try {
      final response =
          await http.post(Uri.parse('$host/api/login'), body: _post);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        //print(res);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', res['token']);
        prefs.setString('nama_pegawai', res['user']['nama_pegawai']);
        prefs.setString('nik', res['user']['nik']);
        return Message.fromJson(res);
      } else {
        return Message.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      Message responseRequest =
          Message(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }
}

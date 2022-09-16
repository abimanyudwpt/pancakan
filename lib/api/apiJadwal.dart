// ignore_for_file: body_might_complete_normally_nullable, unused_local_variable, file_names, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/model/message.dart';

class ApiJadwal {
  static String host = 'http://192.168.1.10/api-sipa/public';
  // static String token = '1|mXcZT7R78C5HghM2yGFBpcvpXkVzfHGK8Fc5w3Jo';

  Future<List<Jadwal>> getJadwal() async {
    Uri urlApi = Uri.parse('$host/api/Jadwal');
    final response = await http.get(urlApi);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => Jadwal.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  static Future<Message> saveJadwal(idKegiatan, jadwal) async {
    try {
      var url = Uri.parse('$host/api/Jadwal');
      if (idKegiatan != 0) {
        url = Uri.parse('$host/api/Jadwal/' + idKegiatan.toString());
      }

      // var url = 'http://192.168.1.10/api-sipa/public/api/Jadwal';
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'nm_kgtn': jadwal['nmKgtn'],
        'tmpt': jadwal['tmpt'],
        'tgl': jadwal['tgl'],
        'jam': jadwal['jam'],
        'interval': jadwal['interval'],
        'peserta': jadwal['peserta'],
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      // var request = http.MultipartRequest('POST', url);
      // request.fields['nmKgtn'] = jadwal['nmKgtn'];
      // request.fields['tmpt'] = jadwal['tmpt'];
      // request.fields['tgl'] = jadwal['tgl'];
      // request.fields['jam'] = jadwal['jam'];
      // request.fields['interval'] = jadwal['interval'];
      // request.fields['peserta'] = jadwal['peserta'];
      // var response = await request.send();

      print(response.statusCode);
      if (response.statusCode == 200) {
        // final respStr = await response.stream.bytesToString();
        // return Message.fromJson(jsonDecode(respStr));\
        print('succces');
        return Message(success: true, message: 'success');
      } else {
        return Message(success: false, message: 'Error Request');
      }
    } catch (e) {
      Message responseRequest =
          Message(success: false, message: 'error caught: $e');
      return responseRequest;
    }
  }

  static Future<Message> deleteJadwal(idKegiatan) async {
    try {
      final response = await http.delete(
        Uri.parse('$host/api/Jadwal/' + idKegiatan.toString()),
      );
      if (response.statusCode == 200) {
        return Message.fromJson(jsonDecode(response.body));
      } else {
        return Message(
            success: false, message: 'Error Periksa Kembali Inputan anda');
      }
    } catch (e) {
      Message responseRequest =
          Message(success: false, message: 'Berhasil di hapus');
      return responseRequest;
    }
  }
}

// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.giat,
    required this.interval,
    required this.tempat,
    required this.peserta,
    required this.tanggal,
    required this.jam,
    required this.id,
  });

  String giat;
  String interval;
  String tempat;
  String peserta;
  DateTime tanggal;
  int jam;
  String id;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        giat: json["giat"],
        interval: json["interval"],
        tempat: json["tempat"],
        peserta: json["peserta"],
        tanggal: DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "giat": giat,
        "interval": interval,
        "tempat": tempat,
        "peserta": peserta,
        "tanggal": tanggal.toString(),
        "jam": jam,
        "id": id,
      };
}

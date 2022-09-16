// ignore_for_file: file_names

import 'dart:convert';

class Jadwal {
  Jadwal({
    required this.idKegiatan,
    required this.nmKgtn,
    required this.tmpt,
    required this.tgl,
    required this.jam,
    required this.interval,
    required this.peserta,
    required this.createdAt,
    required this.updatedAt,
  });

  int idKegiatan;
  String nmKgtn;
  String tmpt;
  String tgl;
  String jam;
  String interval;
  String peserta;
  String createdAt;
  String updatedAt;

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        idKegiatan: json["id_kegiatan"],
        nmKgtn: json["nm_kgtn"],
        tmpt: json["tmpt"],
        tgl: DateTime.parse(json["tgl"]).toString(),
        jam: json["jam"],
        interval: json["interval"],
        peserta: json["peserta"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_kegiatan": idKegiatan,
        "nm_kgtn": nmKgtn,
        "tmpt": tmpt,
        "tgl": tgl.toString(),
        "jam": jam,
        "interval": interval,
        "peserta": peserta,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };

  @override
  String toString() {
    return 'Jadwal{idKegiatan: $idKegiatan,nmKgtn: $nmKgtn,tmpt: $tmpt,tgl: $tgl,jam: $jam,interval: $interval,peserta: $peserta,createdAt: $createdAt,Now: $updatedAt}';
  }
}

List<Jadwal> jadwalFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
}

String jadwalToJson(Jadwal data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

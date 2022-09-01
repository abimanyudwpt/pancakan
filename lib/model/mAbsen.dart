// ignore_for_file: file_names

import 'dart:convert';

class Absen {
  Absen({
    required this.idPresensi,
    required this.kramaId,
    required this.idKegiatan,
    required this.tglAbsen,
    required this.kehadiran,
    required this.createdAt,
    required this.updatedAt,
  });

  int idPresensi;
  int kramaId;
  int idKegiatan;
  String tglAbsen;
  String kehadiran;
  String createdAt;
  String updatedAt;

  factory Absen.fromJson(Map<String, dynamic> json) => Absen(
        idPresensi: json["id_presensi"],
        kramaId: json["krama_id"],
        idKegiatan: json["id_kegiatan"],
        tglAbsen: DateTime.parse(json["tgl_absen"]).toString(),
        kehadiran: json["kehadiran"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_presensi": idPresensi,
        "krama_id": kramaId,
        "id_kegiatan": idKegiatan,
        "tgl_absen": tglAbsen,
        "kehadiran": kehadiran,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

  @override
  String toString() {
    return 'Jadwal{idPresensi: $idPresensi,kramaId: $kramaId,idKegiatan: $idKegiatan,tglAbsen: $tglAbsen,kehadiran: $kehadiran,createdAt: $createdAt,Now: $updatedAt}';
  }
}

List<Absen> absenFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Absen>.from(data.map((item) => Absen.fromJson(item)));
}

String absenToJson(Absen data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}

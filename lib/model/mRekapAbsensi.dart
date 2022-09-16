// ignore_for_file: file_names

class RekapAbsensi {
  RekapAbsensi({
    required this.idRekap,
    required this.kramaId,
    required this.hadir,
    required this.izin,
    required this.tidakHadir,
    required this.nominal,
    required this.statusPembayaran,
    required this.periode,
    required this.jenis,
    required this.createdAt,
    required this.updatedAt,
  });

  int idRekap;
  int kramaId;
  int hadir;
  int izin;
  int tidakHadir;
  int nominal;
  String statusPembayaran;
  int periode;
  String jenis;
  String createdAt;
  String updatedAt;

  factory RekapAbsensi.fromJson(Map<String, dynamic> json) => RekapAbsensi(
        idRekap: json["id_rekap"],
        kramaId: json["krama_id"],
        hadir: json["hadir"],
        izin: json["izin"],
        tidakHadir: json["tidak_hadir"],
        nominal: json["nominal"],
        statusPembayaran: json["status_pembayaran"],
        periode: json["periode"],
        jenis: json["jenis"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_rekap": idRekap,
        "krama_id": kramaId,
        "hadir": hadir,
        "izin": izin,
        "tidak_hadir": tidakHadir,
        "nominal": nominal,
        "status_pembayaran": statusPembayaran,
        "periode": periode,
        "jenis": jenis,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}

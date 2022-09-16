// ignore_for_file: file_names

class DataKrama {
  DataKrama({
    required this.id,
    required this.nik,
    required this.level,
    required this.noKk,
    required this.nm,
    required this.tmpt,
    required this.tgl,
    required this.sttsDlmKlrg,
    required this.jbt,
    required this.bnjrAdt,
    required this.tmpkn,
    required this.stts,
    required this.pndd,
    required this.pkrjn,
    required this.jk,
    required this.ktrgn,
    required this.ft,
    required this.nmDdy,
    required this.nmKtDdy,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nik;
  String level;
  String noKk;
  String nm;
  String tmpt;
  String tgl;
  String sttsDlmKlrg;
  String jbt;
  String bnjrAdt;
  String tmpkn;
  String stts;
  String pndd;
  String pkrjn;
  String jk;
  String ktrgn;
  String ft;
  String nmDdy;
  String nmKtDdy;
  String rememberToken;
  String createdAt;
  String updatedAt;

  factory DataKrama.fromJson(Map<String, dynamic> json) => DataKrama(
        id: json["id"],
        nik: json["nik"],
        level: json["level"],
        noKk: json["no_kk"],
        nm: json["nm"],
        tmpt: json["tmpt"],
        tgl: DateTime.parse(json["tgl"]).toString(),
        sttsDlmKlrg: json["stts_dlm_klrg"],
        jbt: json["jbt"],
        bnjrAdt: json["bnjr_adt"],
        tmpkn: json["tmpkn"],
        stts: json["stts"],
        pndd: json["pndd"],
        pkrjn: json["pkrjn"],
        jk: json["jk"],
        ktrgn: json["ktrgn"],
        ft: json["ft"],
        nmDdy: json["nm_ddy"],
        nmKtDdy: json["nm_kt_ddy"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "level": level,
        "no_kk": noKk,
        "nm": nm,
        "tmpt": tmpt,
        "tgl": tgl,
        "stts_dlm_klrg": sttsDlmKlrg,
        "jbt": jbt,
        "bnjr_adt": bnjrAdt,
        "tmpkn": tmpkn,
        "stts": stts,
        "pndd": pndd,
        "pkrjn": pkrjn,
        "jk": jk,
        "ktrgn": ktrgn,
        "ft": ft,
        "nm_ddy": nmDdy,
        "nm_kt_ddy": nmKtDdy,
        "remember_token": rememberToken,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}

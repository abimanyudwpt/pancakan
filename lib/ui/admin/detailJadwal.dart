// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/ui/admin/detailAbsen.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
import 'listjadwal.dart';

class DetailJadwal extends StatefulWidget {
  final Jadwal jadwal;
  const DetailJadwal({Key? key, required this.jadwal}) : super(key: key);

  @override
  State<DetailJadwal> createState() => _DetailJadwalState();
}

class _DetailJadwalState extends State<DetailJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal'),
        backgroundColor: Colors.blue,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.only(bottom: 60),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Kegiatan ",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    Text(
                      ":",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.nmKgtn,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tempat ",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    Text(
                      "  :",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.tmpt,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Tanggal   :",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.tgl.toString(),
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Pukul       :",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.jam.toString(),
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    Text(
                      " WITA",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Interval   :",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.interval,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Peserta   :",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        widget.jadwal.peserta,
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // width: 100.0,
                  height: 50.0,
                  // ignore: deprecated_member_use
                  child: ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailAbsen(
                                        jadwal: widget.jadwal,
                                      )));
                        },
                        child: Text(
                          'Detail Absen',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue, // Background color
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}

// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names, prefer_adjacent_string_concatenation, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiAbsen.dart';
import 'package:pancakan/api/apiJadwal.dart';
import 'package:pancakan/api/apiKrama.dart';
import 'package:pancakan/model/mAbsen.dart';
import 'package:pancakan/model/mKrama.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
// import './ui/model/launcher.dart';
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/ui/side.dart';
// import 'package:intl/intl.dart';

class DetailAbsen extends StatefulWidget {
  final Jadwal jadwal;
  const DetailAbsen({Key? key, required this.jadwal}) : super(key: key);

  @override
  State<DetailAbsen> createState() => _DetailAbsenState();
}

class _DetailAbsenState extends State<DetailAbsen> {
  late List<DataKrama> krama = [];
  void getKrama() async {
    final response = await ApiAbsen.getKrama();
    setState(() {
      krama = response.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Absensi'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search');
              },
            ),
          ],
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    ),
                    Text(
                        widget.jadwal.nmKgtn +
                            '\n' +
                            'Waktu : ' +
                            widget.jadwal.jam.toString() +
                            '\n' +
                            'Tanggal : ' +
                            widget.jadwal.tgl.toString(),
                        style: TextStyle(
                          fontSize: 17,
                        )),
                  ]),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: ApiAbsen().getAbsen(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as List<Absen>;
                      print('response: $response');
                      return ListView.builder(
                          itemCount: response.length,
                          itemBuilder: (context, position) {
                            var absenItem = response[position];
                            return Container(
                                padding: EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0)),
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ListTile(
                                          title: Text(
                                            absenItem.idKegiatan.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                          trailing: Text(absenItem.kehadiran),
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ));
  }
}

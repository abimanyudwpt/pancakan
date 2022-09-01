// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiJadwal.dart';
import 'package:pancakan/api/apiTest.dart';
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
// import './ui/model/launcher.dart';
import 'package:pancakan/model/m_tester.dart';
import 'package:pancakan/ui/side.dart';
// import 'package:intl/intl.dart';

class Absen extends StatefulWidget {
  final Jadwal jadwal;
  const Absen({Key? key, required this.jadwal}) : super(key: key);

  @override
  State<Absen> createState() => _AbsenState();
}

class _AbsenState extends State<Absen> {
  String status = '';

  void pilih(String value) {
    setState(() {
      status = value.toString();
    });
  }

  List<Post>? post;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    post = await Api().getPost();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Absensi'),
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
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.save),
          label: Text('Simpan'),
          backgroundColor: Colors.green,
          onPressed: () {},
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
                child: Visibility(
              visible: isLoaded,
              child: ListView.builder(
                  itemCount: post?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tempekan : ',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8, right: 8, top: 3),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ButtonBar(
                                          alignment: MainAxisAlignment.center,
                                          children: [
                                            Radio(
                                                value: 'Hadir',
                                                groupValue: status,
                                                activeColor: Colors.green,
                                                onChanged: (value) {
                                                  pilih(value.toString());
                                                }),
                                            Text('Hadir'),
                                            Radio(
                                                value: 'Tidak Hadir',
                                                groupValue: status,
                                                activeColor: Colors.green,
                                                onChanged: (value) {
                                                  pilih(value.toString());
                                                }),
                                            Text('Tidak Hadir'),
                                            Radio(
                                                value: 'Izin',
                                                groupValue: status,
                                                activeColor: Colors.green,
                                                onChanged: (value) {
                                                  pilih(value.toString());
                                                }),
                                            Text('Izin')
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ))
          ],
        ));
  }
}

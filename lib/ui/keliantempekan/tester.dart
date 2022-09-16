// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiTest.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
import 'package:pancakan/model/mTester.dart';
import 'package:pancakan/ui/keliantempekan/detailRekap.dart';

class Tester extends StatefulWidget {
  const Tester({Key? key}) : super(key: key);

  @override
  State<Tester> createState() => _TesterState();
}

class _TesterState extends State<Tester> {
  List<Post>? post;
  var isLoaded = false;
  String status = '';

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

  void pilih(String value) {
    setState(() {
      status = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rekap Absensi'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("data"),
                Text("data"),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 10),
                itemCount: post?.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Card(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama : ' + post![index].giat,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Banjar : ' + post![index].tempat,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tempekan : ' + post![index].jam.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Hadir : ' + post![index].peserta,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Tidak Hadir : ' + post![index].peserta,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Izin : ' + post![index].peserta,
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Nominal : Rp.' +
                                        post![index].tanggal.toString(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ));
                },
              ),
            )
          ],
        ));
  }
}

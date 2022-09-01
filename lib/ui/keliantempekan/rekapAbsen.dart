// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiTest.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
import 'package:pancakan/model/m_tester.dart';
import 'package:pancakan/ui/keliantempekan/detailRekap.dart';

class RekapAbsen extends StatefulWidget {
  const RekapAbsen({Key? key}) : super(key: key);

  @override
  State<RekapAbsen> createState() => _RekapAbsenState();
}

class _RekapAbsenState extends State<RekapAbsen> {
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
        body: Visibility(
          visible: isLoaded,
          // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 10),
                    itemCount: post?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailRekap(
                                            post: post![index],
                                          )));
                            },
                            child: Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      'Nama : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Banjar : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Tempekan : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Hadir : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Izin : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Tidak Hadir : ' + post![index].giat,
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Text(
                                      'Nominal : Rp.' +
                                          post![index].jam.toString(),
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

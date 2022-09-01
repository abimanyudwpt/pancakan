// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiJadwal.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
// import './ui/model/launcher.dart';
import 'package:pancakan/model/m_tester.dart';

class DetailRekap extends StatefulWidget {
  final Post post;

  const DetailRekap({Key? key, required this.post}) : super(key: key);

  @override
  _DetailRekapState createState() => _DetailRekapState();
}

class _DetailRekapState extends State<DetailRekap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.post.giat),
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
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                  padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Nama Kegiatan',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            subtitle: Text(
                                'Tanggal : ' + widget.post.tanggal.toString()),
                            trailing: Text('Status Absen'),
                          )
                        ],
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}

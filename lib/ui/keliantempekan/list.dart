// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiJadwal.dart';
import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/detailJadwal.dart';
import 'package:pancakan/ui/admin/exeJadwal.dart';
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/ui/side.dart';
import 'package:intl/intl.dart';
import 'package:pancakan/ui/keliantempekan/absen.dart';

class ListJ extends StatefulWidget {
  const ListJ({Key? key}) : super(key: key);

  @override
  _ListJState createState() => _ListJState();
}

class _ListJState extends State<ListJ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List Jadwal'),
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
          child: FutureBuilder(
              future: ApiJadwal().getJadwal(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var response = snapshot.data as List<Jadwal>;
                  print('response: $response');
                  return ListView.builder(
                      itemCount: response.length,
                      itemBuilder: (context, position) {
                        var jadwalItem = response[position];
                        return Padding(
                            padding: EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Absen(
                                              jadwal: jadwalItem,
                                            )));
                              },
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        jadwalItem.nmKgtn,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                      Text(
                                        'Lokasi : ' + jadwalItem.tmpt,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        'Waktu : ' + jadwalItem.jam + ' WITA',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        'Tanggal : ' +
                                            jadwalItem.tgl.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}

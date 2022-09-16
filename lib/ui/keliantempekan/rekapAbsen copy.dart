// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, avoid_print, unused_import, file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pancakan/api/apiRekapAbsensi.dart';
// import 'package:pancakan/ui/auth/login.dart';
// import 'package:pancakan/ui/admin/detailJadwal.dart';
// import 'package:pancakan/ui/admin/exeJadwal.dart';
import 'package:pancakan/model/mRekapAbsensi.dart';
import 'package:pancakan/ui/side.dart';
import 'package:intl/intl.dart';
import 'package:pancakan/ui/keliantempekan/absen.dart';
import 'package:pancakan/ui/keliantempekan/detailRekap.dart';

class RekapAbsen extends StatefulWidget {
  const RekapAbsen({Key? key}) : super(key: key);

  @override
  _RekapAbsenState createState() => _RekapAbsenState();
}

class _RekapAbsenState extends State<RekapAbsen> {
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
        body: SafeArea(
          child: FutureBuilder(
              future: ApiRekapAbsensi().getRekapAbsensi(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  var response = snapshot.data as List<RekapAbsensi>;
                  print('response: $response');
                  return ListView.builder(
                      itemCount: response.length,
                      itemBuilder: (context, position) {
                        var rekapItem = response[position];
                        return Padding(
                            padding: EdgeInsets.all(16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailRekap(
                                              rekapAbsensi: rekapItem,
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
                                        'Nama : ' +
                                            rekapItem.kramaId.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      // Text(
                                      //   'Banjar : ' + rekapItem.jadwal,
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .subtitle1,
                                      // ),
                                      // Text(
                                      //   'Tempekan : ' + rekapItem.jadwal,
                                      //   style: Theme.of(context)
                                      //       .textTheme
                                      //       .subtitle1,
                                      // ),
                                      Text(
                                        'Hadir : ' + rekapItem.hadir.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        'Izin : ' + rekapItem.izin.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        'Tidak Hadir : ' +
                                            rekapItem.tidakHadir.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                      Text(
                                        'Nominal : Rp.' +
                                            rekapItem.nominal.toString(),
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

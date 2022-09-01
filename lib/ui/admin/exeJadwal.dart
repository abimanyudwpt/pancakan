// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, unnecessary_null_comparison, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pancakan/api/apiJadwal.dart';
import 'package:pancakan/model/mJadwal.dart';
import 'package:pancakan/model/message.dart';
import 'package:pancakan/ui/admin/listjadwal.dart';

class ExeJadwal extends StatefulWidget {
  final Jadwal jadwal;
  const ExeJadwal({Key? key, required this.jadwal}) : super(key: key);

  @override
  State<ExeJadwal> createState() => _ExeJadwalState();
}

class _ExeJadwalState extends State<ExeJadwal> {
  final _formkey = GlobalKey<FormState>();

  late TextEditingController nmKgtn, tmpt, tgl, jam, interval, peserta;
  late int idKegiatan = 0;
  bool _isupdate = false;
  bool _success = false;
  bool _validate = false;
  late Message response;

  @override
  void initState() {
    nmKgtn = TextEditingController();
    tmpt = TextEditingController();
    tgl = TextEditingController();
    jam = TextEditingController();
    interval = TextEditingController();
    peserta = TextEditingController();
    if (widget.jadwal.idKegiatan != 0) {
      idKegiatan = widget.jadwal.idKegiatan;
      nmKgtn = TextEditingController(text: widget.jadwal.nmKgtn);
      tmpt = TextEditingController(text: widget.jadwal.tmpt);
      tgl = TextEditingController(text: widget.jadwal.tgl);
      jam = TextEditingController(text: widget.jadwal.jam);
      interval = TextEditingController(text: widget.jadwal.interval);
      peserta = TextEditingController(text: widget.jadwal.peserta);
      _isupdate = true;
    }
    super.initState();
  }

  void submit() async {
    // _formkey.currentState!.save();
    var params = {
      'nmKgtn': nmKgtn.text.toString(),
      'tmpt': tmpt.text.toString(),
      'tgl': tgl.text.toString(),
      'jam': jam.text.toString(),
      'interval': interval.text.toString(),
      'peserta': peserta.text.toString(),
    };
    response = await ApiJadwal.saveJadwal(idKegiatan, params);
    _success = response.success;
    final snackBar = SnackBar(
      content: Text(response.message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    if (_success) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => ListJadwal()));
    }
    // } else {
    //   _validate = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isupdate ? Text('Ubah Jadwal') : Text('Tambah Jadwal'),
        // title: Text('Tambah Jadwal'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(10),
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                controller: nmKgtn,
                validator: (u) => u == "" ? "Wajib Diisi" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.assignment),
                  labelText: 'Rencana Kegiatan',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                controller: interval,
                validator: (u) => u == "" ? "Wajib Diisi" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.assignment),
                  labelText: 'Interval',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                controller: tmpt,
                validator: (u) => u == "" ? "Wajib Diisi" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on),
                  labelText: 'Tempat',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                controller: peserta,
                validator: (u) => u == "" ? "Wajib Diisi" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: 'Peserta',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextField(
                controller: tgl,
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: 'Tanggal',
                ),
                onTap: () async {
                  DateTime? pickeddate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickeddate != null) {
                    setState(() {
                      tgl.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                controller: jam,
                validator: (u) => u == "" ? "Wajib Diisi" : null,
                decoration: InputDecoration(
                  icon: Icon(Icons.access_time),
                  labelText: 'Jam',
                ),
              ),
            ),
            SizedBox(
                // width: MediaQuery.of(context).size.width,
                width: 100.0,
                height: 40.0,
                // ignore: deprecated_member_use
                child: Row(children: [
                  ElevatedButton(
                    onPressed: () {
                      // if (_formkey.currentState!.validate()) {
                      submit();
                      // }
                    },
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Background color
                    ),
                  ),
                ]))
          ],
        ),
      )),
    );
  }
}

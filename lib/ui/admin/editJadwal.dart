// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, unnecessary_null_comparison, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pancakan/model/mJadwal.dart';

class EditJadwal extends StatefulWidget {
  final Jadwal jadwal;
  const EditJadwal({Key? key, required this.jadwal}) : super(key: key);
  @override
  State<EditJadwal> createState() => _EditJadwalState();
}

class _EditJadwalState extends State<EditJadwal> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  late String nmKgtn, tmpt, tgl, jam, interval, peserta;

  late TextEditingController txtNmKgtn,
      txtTmpt,
      txtTgl,
      txtJam,
      txtInterval,
      txtPeserta;
  setup() {
    txtNmKgtn = TextEditingController(text: widget.jadwal.nmKgtn);
    txtTmpt = TextEditingController(text: widget.jadwal.tmpt);
    txtTgl = TextEditingController(text: widget.jadwal.tgl);
    txtJam = TextEditingController(text: widget.jadwal.jam);
    txtInterval = TextEditingController(text: widget.jadwal.interval);
    txtPeserta = TextEditingController(text: widget.jadwal.peserta);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: _isupdate ? Text('Ubah Jadwal') : Text('Tambah Jadwal'),
        title: Text('Edit Jadwal'),
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
                controller: txtNmKgtn,
                validator: null,
                decoration: InputDecoration(
                  icon: Icon(Icons.assignment),
                  labelText: 'Rencana Kegiatan',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                // controller: intervalController,
                validator: null,
                decoration: InputDecoration(
                  icon: Icon(Icons.assignment),
                  labelText: 'Interval',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                // controller: tmptController,
                validator: null,
                decoration: InputDecoration(
                  icon: Icon(Icons.location_on),
                  labelText: 'Tempat',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                // controller: pesertaController,
                validator: null,
                decoration: InputDecoration(
                  icon: Icon(Icons.people),
                  labelText: 'Peserta',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextField(
                // controller: tglController,
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
                      // tglController.text =
                      DateFormat('yyyy/MM/dd').format(pickeddate);
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: TextFormField(
                // controller: jamController,
                validator: null,
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
                      print('Simpan');
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

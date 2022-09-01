import 'package:flutter/material.dart';
// import 'package:pancakan/ui/auth/login.dart';
import 'package:pancakan/ui/admin/listjadwal.dart';
// import 'package:pancakan/ui/keliantempekan/dashboard.dart';
//import 'package:pancakan/ui/keliantempekan/detailRekap.dart';
// import 'package:pancakan/ui/admin/injadwal.dart';
// import 'package:pancakan/ui/admin/landing.dart';
// import './ui/admin/launcher.dart';
// import './ui/admin/absen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ignore: prefer_const_constructors
      home: ListJadwal(),
    );
  }
}

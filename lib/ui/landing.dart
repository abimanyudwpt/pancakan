import 'package:flutter/material.dart';
import 'admin/listjadwal.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List _page = [const ListJadwal()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _page[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(.60),
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.info,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.info,
                color: Colors.grey,
              ),
              label: 'Jadwal',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.people,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.people,
                color: Colors.grey,
              ),
              label: 'List Jadwal',
            ),
          ],
        ));
  }
}

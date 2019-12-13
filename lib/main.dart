import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie6_code_test/pages/EmptyPage.dart';
import 'package:movie6_code_test/pages/MovieList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.grey,
      ),
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  //init page is 1
  int _currentIndex = 1;
  List<Widget> pages = [EmptyPage(), MovieList(), EmptyPage(), EmptyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,

        //remove title of BottomNavigationBarItem
        //https://stackoverflow.com/a/52182628/5588637
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lens,
                color: _currentIndex == 0 ? Colors.white : Colors.grey,
              ),
              title: Text('Empty')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_movies,
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
              title: Text('Movie')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lens,
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
              title: Text('Empty')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.lens,
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
              ),
              title: Text('Empty'))
        ],
      ),
      body: pages[_currentIndex],
    );
  }
}

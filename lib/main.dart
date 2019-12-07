import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('電影'),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,

          //remove title of BottomNavigationBarItem
          //https://stackoverflow.com/a/52182628/5588637
          showSelectedLabels: false,
          showUnselectedLabels: false,

          currentIndex: _currentIndex,
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
          ]),
    );
  }
}

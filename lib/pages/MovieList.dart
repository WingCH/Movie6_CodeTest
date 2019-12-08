import 'package:flutter/material.dart';
import 'package:movie6_code_test/widgets/Movie_ListItem.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.black,
            ),
        itemCount: 20,
        itemBuilder: (BuildContext _context, int i) {
          return MovieListItem(i);
        });
  }
}

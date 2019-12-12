import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie6_code_test/api/movie6_api.dart';
import 'package:movie6_code_test/models/movies.dart';
import 'package:movie6_code_test/widgets/Movie_ListItem.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  List<Movies> movieList = List<Movies>();

  void getMovieData() async {
    var result = await Movie6API().getMovieList();
    print(result);

    setState(() {
      movieList = moviesFromJson(result);
    });

  }
  @override
  void initState() {
    super.initState();
    getMovieData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('電影'),
          leading: IconButton(
            icon: Icon(FontAwesomeIcons.qrcode,
                color: Theme.of(context).accentColor),
            onPressed: null,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Theme.of(context).accentColor),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.border_left, color: Theme.of(context).accentColor),
              onPressed: null,
            ),
          ],
        ),
      body: ListView.separated(
          separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.black,
              ),
          itemCount: movieList.length,
          itemBuilder: (BuildContext _context, int i) {
            return MovieListItem(movieList[i]);
          }),
    );
  }
}

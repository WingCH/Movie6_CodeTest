import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie6_code_test/api/movie6_api.dart';
import 'package:movie6_code_test/models/movies.dart';
import 'package:movie6_code_test/widgets/Movie_GridItem.dart';
import 'package:movie6_code_test/widgets/Movie_ListItem.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movies> _movieList = List<Movies>();
  bool _isList = false;

  void getMovieData() async {
    var result = await Movie6API().getMovieList();
    print(result);

    setState(() {
      _movieList = moviesFromJson(result);
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
      backgroundColor: Colors.black,
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
            onPressed: () {
              setState(() {
                _isList = !_isList;
              });
            },
          ),
        ],
      ),
      body: _isList ? buildListView() : buildGridView(),
    );
  }

  ListView buildListView() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(
              height: 1,
              color: Colors.black,
            ),
        itemCount: _movieList.length,
        itemBuilder: (BuildContext _context, int i) {
          return MovieListItem(_movieList[i]);
        });
  }

  GridView buildGridView() {
    return GridView.count(
      // 每行三個
      crossAxisCount: 3,
      // 長闊比例
      childAspectRatio: 0.5,
      children: List.generate(_movieList.length, (index) {
        return MovieGridItem(_movieList[index]);
      }),
    );
  }
}

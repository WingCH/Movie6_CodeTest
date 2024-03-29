import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie6_code_test/api/movie6_api.dart';
import 'package:movie6_code_test/models/movies.dart';
import 'package:movie6_code_test/models/swiperModel.dart';
import 'package:movie6_code_test/widgets/Component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MovieDetail extends StatefulWidget {
  final int movieId;

  MovieDetail(this.movieId);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Future<Movies> getMovieData(_movieId) async {
    var result = await Movie6API().getMovieDetail(_movieId);
    return movieFromJson(result);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("電影資訊"),
      ),
      body: FutureBuilder<Movies>(
        future: getMovieData(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return MovieDetailContent(movieDetail: snapshot.data);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    Key key,
    @required Movies movieDetail,
  })  : _movie = movieDetail,
        super(key: key);

  final Movies _movie;

  @override
  Widget build(BuildContext context) {
    List<SwiperModel> screenShots = List<SwiperModel>();

    for (final youtubeUrl in _movie.multitrailers) {
      screenShots.add(SwiperModel(youtubeUrl, SwiperType.video));
    }
    for (final imageUrl in _movie.screenShots) {
      screenShots.add(SwiperModel(imageUrl, SwiperType.image));
    }

    screenShots.length;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 250,
            child: Swiper(
//                outer: true,
                onTap: (index) async {
                  if (screenShots[index].type == SwiperType.video) {
                    if (await canLaunch(screenShots[index].url)) {
                      await launch(screenShots[index].url);
                    } else {
                      throw 'Could not launch ${screenShots[index].url}';
                    }
                  }
                },
                itemBuilder: (BuildContext context, int index) {
                  if (screenShots[index].type == SwiperType.image) {
                    return Image.network(
                      screenShots[index].screenShotUrl,
                      fit: BoxFit.cover,
                    );
                  } else {
//                    return  Container(
//                      width: double.infinity,
//                        child: WebView(
//
//                          initialUrl: Uri.dataFromString('<iframe width="100%" height="100%"  src="https://www.youtube.com/embed/kTIEM2uyrcA" frameborder="0" allowfullscreen></iframe>', mimeType: 'text/html').toString(),
//                          javascriptMode: JavascriptMode.unrestricted,
//                        ));
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Image.network(
                            screenShots[index].screenShotUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(FontAwesomeIcons.youtube,
                                size: 80, color: Colors.grey),
                          ),
                        ),
                      ],
                    );
                  }
                },
                itemCount: screenShots.length,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      activeColor: Colors.white, color: Colors.grey),
                )),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 100, child: MovieListRating(3.5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(_movie.chiName,
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  MovieLikeAndComment(_movie.favCount, _movie.commentCount),
                  Row(
                    children: <Widget>[
                      MovieListDate(_movie.openDate, Colors.white),
                      Container(
                        height: 20.0,
                        width: 1.0,
                        color: Color.fromRGBO(253, 220, 11, 1),
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      ),
                      Text(
                          _movie.infoDict.duration != null
                              ? _movie.infoDict.duration.toString() + "分鐘"
                              : ' - ' + "分鐘",
                          style: TextStyle(color: Colors.white)),
                      Container(
                        height: 20.0,
                        width: 1.0,
                        color: Color.fromRGBO(253, 220, 11, 1),
                        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                      ),
                      Text(
                          _movie.infoDict.category.toString().substring(_movie
                                      .infoDict.category
                                      .toString()
                                      .indexOf('.') +
                                  1) +
                              "級",
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
            child: ExpandText(_movie.chiSynopsis,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white),
                maxLength: 4,
                arrowColor: Colors.white),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, top: 10, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                NameContent('導遊', _movie.chiInfoDict.director),
                NameContent('演員', _movie.chiInfoDict.cast),
                NameContent('類型', _movie.chiInfoDict.genre),
                NameContent('語言', _movie.chiInfoDict.language),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NameContent extends StatelessWidget {
  NameContent(this.title, this.content);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Text(title,
                style: TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w500))),
        Expanded(
          flex: 8,
          child: Text(
            content,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

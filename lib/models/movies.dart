// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

// Generate by https://github.com/quicktype/quicktype
import 'dart:convert';

List<Movies> moviesFromJson(String str) => List<Movies>.from(json.decode(str).map((x) => Movies.fromJson(x)));
String moviesToJson(List<Movies> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

Movies movieFromJson(String str) => Movies.fromJson(json.decode(str));
String movieToJson(Movies data) => json.encode(data.toJson());

class Movies {
  int id;
  String uuid;
  String name;
  String chiName;
  String dbTrailerUrl;
  String thumbnail;
  String openDate;
  int duration;
  String synopsis;
  String chiSynopsis;
  int rating;
  int interestingness;
  int commentCount;
  int interestingnessComing;
  String engNormalAltNames;
  int favCount;
  String language;
  String chiLanguage;
  bool isCommentable;
  bool isShowPromoIcon;
  bool isOpenMonth;
  int status;
  Pagination pagination;
  bool favourite;
  bool notification;
  List<String> screenShots;
  String commentDate;
  int rateCount;
  List<String> multitrailers;
  String trailerUrl;
  InfoDict infoDict;
  ChiInfoDict chiInfoDict;
  String urlDesc;
  String chiUrlDesc;
  String url;
  int index;
  String platform;
  String startDate;
  String endDate;
  bool isExternalBrowser;
  bool advertorial;

  Movies({
    this.id,
    this.uuid,
    this.name,
    this.chiName,
    this.dbTrailerUrl,
    this.thumbnail,
    this.openDate,
    this.duration,
    this.synopsis,
    this.chiSynopsis,
    this.rating,
    this.interestingness,
    this.commentCount,
    this.interestingnessComing,
    this.engNormalAltNames,
    this.favCount,
    this.language,
    this.chiLanguage,
    this.isCommentable,
    this.isShowPromoIcon,
    this.isOpenMonth,
    this.status,
    this.pagination,
    this.favourite,
    this.notification,
    this.screenShots,
    this.commentDate,
    this.rateCount,
    this.multitrailers,
    this.trailerUrl,
    this.infoDict,
    this.chiInfoDict,
    this.urlDesc,
    this.chiUrlDesc,
    this.url,
    this.index,
    this.platform,
    this.startDate,
    this.endDate,
    this.isExternalBrowser,
    this.advertorial,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
    id: json["id"],
    uuid: json["uuid"] == null ? null : json["uuid"],
    name: json["name"],
    chiName: json["chiName"],
    dbTrailerUrl: json["dbTrailerUrl"] == null ? null : json["dbTrailerUrl"],
    thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
    openDate: json["openDate"],
    duration: json["duration"] == null ? null : json["duration"],
    synopsis: json["synopsis"] == null ? null : json["synopsis"],
    chiSynopsis: json["chiSynopsis"] == null ? null : json["chiSynopsis"],
    rating: json["rating"] == null ? null : json["rating"],
    interestingness: json["interestingness"] == null ? null : json["interestingness"],
    commentCount: json["commentCount"] == null ? null : json["commentCount"],
    interestingnessComing: json["interestingnessComing"] == null ? null : json["interestingnessComing"],
    engNormalAltNames: json["engNormalAltNames"] == null ? null : json["engNormalAltNames"],
    favCount: json["favCount"] == null ? null : json["favCount"],
    language: json["language"] == null ? null : json["language"],
    chiLanguage: json["chiLanguage"] == null ? null : json["chiLanguage"],
    isCommentable: json["isCommentable"] == null ? null : json["isCommentable"],
    isShowPromoIcon: json["isShowPromoIcon"] == null ? null : json["isShowPromoIcon"],
    isOpenMonth: json["isOpenMonth"] == null ? null : json["isOpenMonth"],
    status: json["status"] == null ? null : json["status"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    favourite: json["favourite"] == null ? null : json["favourite"],
    notification: json["notification"] == null ? null : json["notification"],
    screenShots: List<String>.from(json["screenShots"].map((x) => x)),
    commentDate: json["commentDate"] == null ? null : json["commentDate"],
    rateCount: json["rateCount"] == null ? null : json["rateCount"],
    multitrailers: json["multitrailers"] == null ? null : List<String>.from(json["multitrailers"].map((x) => x)),
    trailerUrl: json["trailerUrl"] == null ? null : json["trailerUrl"],
    infoDict: InfoDict.fromJson(json["infoDict"]),
    chiInfoDict: ChiInfoDict.fromJson(json["chiInfoDict"]),
    urlDesc: json["urlDesc"] == null ? null : json["urlDesc"],
    chiUrlDesc: json["chiUrlDesc"] == null ? null : json["chiUrlDesc"],
    url: json["url"] == null ? null : json["url"],
    index: json["index"] == null ? null : json["index"],
    platform: json["platform"] == null ? null : json["platform"],
    startDate: json["startDate"] == null ? null : json["startDate"],
    endDate: json["endDate"] == null ? null : json["endDate"],
    isExternalBrowser: json["isExternalBrowser"] == null ? null : json["isExternalBrowser"],
    advertorial: json["advertorial"] == null ? null : json["advertorial"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid == null ? null : uuid,
    "name": name,
    "chiName": chiName,
    "dbTrailerUrl": dbTrailerUrl == null ? null : dbTrailerUrl,
    "thumbnail": thumbnail == null ? null : thumbnail,
    "openDate": openDate,
    "duration": duration == null ? null : duration,
    "synopsis": synopsis == null ? null : synopsis,
    "chiSynopsis": chiSynopsis == null ? null : chiSynopsis,
    "rating": rating == null ? null : rating,
    "interestingness": interestingness == null ? null : interestingness,
    "commentCount": commentCount == null ? null : commentCount,
    "interestingnessComing": interestingnessComing == null ? null : interestingnessComing,
    "engNormalAltNames": engNormalAltNames == null ? null : engNormalAltNames,
    "favCount": favCount == null ? null : favCount,
    "language": language == null ? null : language,
    "chiLanguage": chiLanguage == null ? null : chiLanguage,
    "isCommentable": isCommentable == null ? null : isCommentable,
    "isShowPromoIcon": isShowPromoIcon == null ? null : isShowPromoIcon,
    "isOpenMonth": isOpenMonth == null ? null : isOpenMonth,
    "status": status == null ? null : status,
    "pagination": pagination == null ? null : pagination.toJson(),
    "favourite": favourite == null ? null : favourite,
    "notification": notification == null ? null : notification,
    "screenShots": List<dynamic>.from(screenShots.map((x) => x)),
    "commentDate": commentDate == null ? null : commentDate,
    "rateCount": rateCount == null ? null : rateCount,
    "multitrailers": multitrailers == null ? null : List<dynamic>.from(multitrailers.map((x) => x)),
    "trailerUrl": trailerUrl == null ? null : trailerUrl,
    "infoDict": infoDict.toJson(),
    "chiInfoDict": chiInfoDict.toJson(),
    "urlDesc": urlDesc == null ? null : urlDesc,
    "chiUrlDesc": chiUrlDesc == null ? null : chiUrlDesc,
    "url": url == null ? null : url,
    "index": index == null ? null : index,
    "platform": platform == null ? null : platform,
    "startDate": startDate == null ? null : startDate,
    "endDate": endDate == null ? null : endDate,
    "isExternalBrowser": isExternalBrowser == null ? null : isExternalBrowser,
    "advertorial": advertorial == null ? null : advertorial,
  };
}

class ChiInfoDict {
  String actor;
  String language;
  Empty grade;
  String director;
  String length;
  String type;

  ChiInfoDict({
    this.actor,
    this.language,
    this.grade,
    this.director,
    this.length,
    this.type,
  });

  factory ChiInfoDict.fromJson(Map<String, dynamic> json) => ChiInfoDict(
    actor: json["演員"] == null ? null : json["演員"],
    language: json["語言"] == null ? null : json["語言"],
    grade: json["級別"] == null ? null : emptyValues.map[json["級別"]],
    director: json["導演"] == null ? null : json["導演"],
    length: json["片長"] == null ? null : json["片長"],
    type: json["類型"] == null ? null : json["類型"],
  );

  Map<String, dynamic> toJson() => {
    "演員": actor == null ? null : actor,
    "語言": language == null ? null : language,
    "級別": grade == null ? null : emptyValues.reverse[grade],
    "導演": director == null ? null : director,
    "片長": length == null ? null : length,
    "類型": type == null ? null : type,
  };
}

enum Empty { IIB, IIA, TBC, I, III }

final emptyValues = EnumValues({
  "I": Empty.I,
  "IIA": Empty.IIA,
  "IIB": Empty.IIB,
  "III": Empty.III,
  "TBC": Empty.TBC
});

class InfoDict {
  String cast;
  Empty category;
  String language;
  String director;
  String duration;
  String genre;

  InfoDict({
    this.cast,
    this.category,
    this.language,
    this.director,
    this.duration,
    this.genre,
  });

  factory InfoDict.fromJson(Map<String, dynamic> json) => InfoDict(
    cast: json["Cast"] == null ? null : json["Cast"],
    category: json["Category"] == null ? null : emptyValues.map[json["Category"]],
    language: json["Language"] == null ? null : json["Language"],
    director: json["Director"] == null ? null : json["Director"],
    duration: json["Duration"] == null ? null : json["Duration"],
    genre: json["Genre"] == null ? null : json["Genre"],
  );

  Map<String, dynamic> toJson() => {
    "Cast": cast == null ? null : cast,
    "Category": category == null ? null : emptyValues.reverse[category],
    "Language": language == null ? null : language,
    "Director": director == null ? null : director,
    "Duration": duration == null ? null : duration,
    "Genre": genre == null ? null : genre,
  };
}

class Pagination {
  List<dynamic> comments;
  int page;
  int size;
  int total;

  Pagination({
    this.comments,
    this.page,
    this.size,
    this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    comments: List<dynamic>.from(json["comments"].map((x) => x)),
    page: json["page"],
    size: json["size"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "comments": List<dynamic>.from(comments.map((x) => x)),
    "page": page,
    "size": size,
    "total": total,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

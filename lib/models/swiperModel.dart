enum SwiperType { video, image }

class SwiperModel {
  String url;
  SwiperType type;

  SwiperModel(this.url, this.type);

  String get screenShotUrl {
    if (type == SwiperType.image) {
      return url;
    } else {
      //original Url: https://www.youtube.com/watch?v=kTIEM2uyrcA
      String originalUrl = url;
      //https://stackoverflow.com/a/54200105/5588637
      RegExp exp = new RegExp(r"(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)");
      //kTIEM2uyrcA
      String youtubeId = url.split(exp)[1];

      //https://img.youtube.com/vi/<insert-youtube-video-id-here>/0.jpg
      //https://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api
      return "https://img.youtube.com/vi/$youtubeId/0.jpg";
    }
  }
}

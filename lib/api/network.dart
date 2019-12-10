import 'dart:io';
import 'package:dio/dio.dart';

class Network {
  final String url;

  Network(this.url);

  Future getData() async {
    try {
      Response response = await Dio()
          .get(url, options: Options(responseType: ResponseType.plain));
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      }
    } catch (e) {
      print(e);
    }
  }
}

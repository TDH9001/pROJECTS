import 'package:dio/dio.dart';

class Newsservice {
  Newsservice(this.dio);
  //Dio dio = Dio();
  Dio dio;
  // void getnews() async {
  //   final response = await dio.get(
  //       'https://newsapi.org/v2/everything?q=keyword&apiKey=6d6bfb6954b04753bd81583fa3c5e3cd');
  //   print(response);
  // }

  getNews({String country = "eg", String? catagory}) async {
    String s =
        "https://newsapi.org/v2/top-headlines/sources?apiKey=6d6bfb6954b04753bd81583fa3c5e3cd&language=ar";

    // s += "&$country";

    if (catagory != null) {
      s += "&$catagory";
    }
    Response res = await dio.get("$s");
    Map<String, dynamic> jsonData = res.data;
    List<dynamic> art = jsonData["sources"];
    for (int i = 0; i < art.length; i++) {
      print(art[i]["id"]);
    }
  }
}

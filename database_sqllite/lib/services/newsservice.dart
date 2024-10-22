import 'package:database_sqllite/models/articleModels.dart';
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

  Future<List<ArticleModel>> getNews() async {
    String s =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=6d6bfb6954b04753bd81583fa3c5e3cd";
    try {
      Response res = await dio.get("$s");
      Map<String, dynamic> jsonData = res.data;

      List<dynamic> art = jsonData["articles"];

      List<ArticleModel> artm = [];
      print(art.length);
      for (int i = 0; i < art.length; i++) {
        artm.add(ArticleModel(
            art[i]["urlToImage"], art[i]["title"], art[i]["description"]));
      }
      return artm;
    } catch (e) {
      print(e);
      return [];
    }
    //  print(art);
    // for (int i = 0; i < art.length; i++) {
    //   print(artm[i]);
    // }
  }
}

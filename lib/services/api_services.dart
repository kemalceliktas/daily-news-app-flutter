import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


import '../model/article_model.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=tr&category=general&apiKey=da2353474223466f9e1d9b136d841bd0";

Future <List<ArticleModel>> getArticle(String category)async{
  final apiUrl="http://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=da2353474223466f9e1d9b136d841bd0";
  Response res= await get(Uri.parse(apiUrl));
  if (res.statusCode ==200) {
    Map<String,dynamic> json = jsonDecode(res.body);

    List<dynamic> body = json["articles"];

    List<ArticleModel> articles=body.map((item) => ArticleModel.fromJson(item)).toList();

    return articles;

  }else{
    print("error");
    throw("Errorrr");
  }
}
}

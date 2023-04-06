//import 'dart:html';

import 'dart:math';

import '../models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Article>> getArticle() async{
  List<Article> MyArticle=[];

  String Url='https://newsapi.org/v2/top-headlines?country=in&apiKey=1bce48199bbb4cccb007c13c00140310';
  var response= await http.get(Uri.parse(Url));
  var jsonData=jsonDecode(response.body);

  if(jsonData['status']=='ok'){
    jsonData['articles'].forEach((element){

      if(element['urlToImage']!=null && element['description']!=null ){
        Article article=Article();
        article.urlToImage=element['urlToImage'];
        article.description=element['description'];
        article.title=element['title'];
        article.author=element['source']['name'];
        MyArticle.add(article);
      }


    });
  }

 return MyArticle;
}
Future<List<Article>> getArticleBusiness(String Url) async{
  List<Article> MyArticle=[];

 // String Url='https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=1bce48199bbb4cccb007c13c00140310';
  var response= await http.get(Uri.parse(Url));
  var jsonData=jsonDecode(response.body);

  if(jsonData['status']=='ok'){
    jsonData['articles'].forEach((element){

      if(element['urlToImage']!=null && element['description']!=null ){
        Article article=Article();
        article.urlToImage=element['urlToImage'];
        article.description=element['description'];
        article.title=element['title'];
        article.author=element['source']['name'];
        article.articleUrl=element['url'];
        MyArticle.add(article);
      }


    });
  }

  return MyArticle;
}
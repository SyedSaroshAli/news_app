import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];

  Future<void> getNews()async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=63cd9f71ffef457ea692482ed137d03e';
    var response = await http.get(Uri.parse(url));

    var newsData = jsonDecode(response.body);

    if(newsData['status']=='ok'){
      newsData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element['urlToImage']!=null){
          ArticleModel articleModel= ArticleModel(
            author: element['author'],
            content:element['content'],
            description: element['description'],
            title:element["title"],
            url: element['url'],
            urlToImage: element['urlToImage'],
            );
          news.add(articleModel);
        }
      });
    }
  } 
}

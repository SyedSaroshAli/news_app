import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/slider_model.dart';

class Sliders{
  List<SliderModel> slidernews =[];

  Future<void> getSlider()async{
    String url = 'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=63cd9f71ffef457ea692482ed137d03e';
    var response = await http.get(Uri.parse(url));

    var newsData = jsonDecode(response.body);

    if(newsData['status']=='ok'){
      newsData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element['urlToImage']!=null){
          SliderModel sliderModel= SliderModel(
            author2: element['author'],
            content2:element['content'],
            description2: element['description'],
            title2:element["title"],
            url2: element['url'],
            urlToImage2: element['urlToImage'],
            );
          slidernews.add(sliderModel);
        }
      });
    }
  } 
}


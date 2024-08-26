import 'dart:convert';

//import 'package:flutter/material.dart';
//import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category_model.dart';

class ShowCategoryNewsClass{
  
  List<ShowCategoryModel> showCategory =[];

  Future<void> showCategoryNews(String category)async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=63cd9f71ffef457ea692482ed137d03e';
    var response = await http.get(Uri.parse(url));

    var categoryData = jsonDecode(response.body);

    if(categoryData['status']=='ok'){
      categoryData['articles'].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null && element['urlToImage']!=null){
          ShowCategoryModel showCategoryModel= ShowCategoryModel(
            author: element['author'],
            content:element['content'],
            description: element['description'],
            title:element["title"],
            url: element['url'],
            urlToImage: element['urlToImage'],
            );
          showCategory.add(showCategoryModel);
        }
      });
    }
  } 
}

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/widgets/all_trending.dart';

class ViewAllTrending extends StatefulWidget {
  const ViewAllTrending({super.key});

  @override
  State<ViewAllTrending> createState() => _ViewAllHeadlinesState();
}

class _ViewAllHeadlinesState extends State<ViewAllTrending> {
  bool _loading =true;
  List<ArticleModel> articles = [];

  
      @override
  void initState() {
    getNews();
    super.initState();
  }

   Future<void> getNews()async{
    News newsClass=News();
     await newsClass.getNews();
      setState(() {
        articles = newsClass.news;
        _loading = false;
    });  
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title:  Stack(
          children: [
            Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
             children: [
              Text('All Trending News',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),),
             ],
            ),
          ),
        ]
        ),
        elevation: 0,
      ),

      body: _loading? Center(child: CircularProgressIndicator(),):
      Column(
        children: [
            Expanded(
          child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context,index){
              return AllTrendingNewsTiles(
                author: articles[index].author.toString(),
                title: articles[index].title.toString(), 
                description: articles[index].description.toString(), 
                url: articles[index].url.toString(), 
                urlToImage: articles[index].urlToImage.toString(), 
                content: articles[index].content.toString());
            }))
        ],
      ) ,
    );
  }
}
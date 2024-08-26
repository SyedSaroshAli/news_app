import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:news_app/widgets/all_headlines.dart';
import 'package:news_app/widgets/all_trending.dart';

class ViewAllHeadlines extends StatefulWidget {
  const ViewAllHeadlines({super.key});

  @override
  State<ViewAllHeadlines> createState() => _ViewAllHeadlinesState();
}

class _ViewAllHeadlinesState extends State<ViewAllHeadlines> {
  bool _loading =true;
  List<SliderModel> sliders = [];
  
      @override
  void initState() {
    getSlider();
    super.initState();
  }

Future<void> getSlider()async{
    Sliders newsSliders=Sliders();
     await newsSliders.getSlider();
      setState(() {
        sliders = newsSliders.slidernews;
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
              Text('All Headline News',
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
            itemCount: sliders.length,
            itemBuilder: (context,index){
              return AllHeadlineNewsTiles(
                author: sliders[index].author2.toString(),
                title: sliders[index].title2.toString(), 
                description: sliders[index].description2.toString(), 
                url: sliders[index].url2.toString(), 
                urlToImage: sliders[index].urlToImage2.toString(), 
                content: sliders[index].content2.toString());
            }))
        ],
      ) ,
    );
  }
}
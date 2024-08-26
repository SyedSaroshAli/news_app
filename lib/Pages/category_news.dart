import 'package:flutter/material.dart';
import 'package:news_app/models/show_category_model.dart';
import 'package:news_app/services/show_categories.dart';
import 'package:news_app/widgets/news_category_widget.dart';

class CategoryNews extends StatefulWidget {
  final String categoryName ;
  const CategoryNews({super.key,
  required this.categoryName});

  
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> showCategory = [];
  bool _loading = true;

  
    @override
  void initState() {
    showCategoryNews();
    super.initState();
  }
  
  Future<void> showCategoryNews()async{
    ShowCategoryNewsClass showCategoryNews=ShowCategoryNewsClass();
     await showCategoryNews.showCategoryNews(widget.categoryName);
      setState(() {
        showCategory = showCategoryNews.showCategory;
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
              Text(widget.categoryName.toUpperCase(),
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
            itemCount: showCategory.length,
            itemBuilder: (context,index){
              return CategoryNewsTiles(
                author: showCategory[index].author.toString(),
                title: showCategory[index].title.toString(), 
                description: showCategory[index].description.toString(), 
                url: showCategory[index].url.toString(), 
                urlToImage: showCategory[index].urlToImage.toString(), 
                content: showCategory[index].content.toString());
            }))
        ],
      )
    );
  }
}
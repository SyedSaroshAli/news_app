import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:news_app/Pages/article_view.dart';
import 'package:news_app/Pages/news_details.dart';
import 'package:news_app/Pages/view_all_trending.dart';
//import 'package:news_app/models/article_model.dart';

class AllHeadlineNewsTiles extends StatelessWidget {
  final String author, title, description, url, urlToImage, content;

  const AllHeadlineNewsTiles({
    Key? key,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14,left: 8,right: 8),
      child: GestureDetector(
        onTap:(){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(author: author, content: content, urlToImage: urlToImage, url: url, title: title, description: description)));
        } ,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: urlToImage,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                 placeholder: (context, url) => Container(
                     height: 120,
                     width: 150,
                     color: Colors.grey[300],
                     child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) {
                      print('Failed to load image: $url');
                      print('Error: $error');
                      return Container(
                        height: 120,
                        width: 150,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      );}),
                  
              ),
              
              const SizedBox(height: 5,),
              Text(title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color:Colors.black
              ),),
              const SizedBox(height: 5,),
              Text(description)
            ],
          )
        ),
      ),
    );}}
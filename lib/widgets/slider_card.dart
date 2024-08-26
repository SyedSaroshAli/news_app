import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Pages/news_details.dart';

class SliderCards extends StatelessWidget {
  final String name , imageUrl,author,content,url,description;
  const SliderCards({super.key, required this.name, required this.imageUrl, required this.author, required this.content, required this.url, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewsDetails(author: author, content: content, urlToImage: imageUrl, url: url, title: name, description: description)));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: 250,
            width: MediaQuery.of(context).size.width,),
          ),
      
          Container(
            height: 250,
            margin: EdgeInsets.only(top: 170),
            padding: EdgeInsets.only(left:10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
            ),
            child: Text(name, 
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 20
            ),),
          )
        ]),
      ),
    );
  }
}